//  Created by Francesco Stabile on 30/01/25.
//
import Foundation

public class Container: ContainerProtocol {
    @MainActor public static let shared = Container()
    
    private init() { }
    
    var services: [ String: Any ] = [:]
    
    public func register<T>(_ serviceType: T.Type, component: Any, lifeCycle: LifeCycle) {
        
        switch lifeCycle {
        case .singleton:
            services["\(serviceType)"] = component
        case .scoped(let scopedContext):
            scopedContext.register(serviceType, component: component)
        case .transient:
            services["\(serviceType)"] = String(describing: type(of: component))
        }
    }
    
    public func resolve<T>(_ serviceType: T.Type, lifeCycle: LifeCycle) -> T? {
        switch lifeCycle {
        case .singleton:
            return services["\(serviceType)"] as? T
        case .scoped(let context):
            return context.resolve(serviceType)
        case .transient:
            let appName = Bundle.main.infoDictionary?["CFBundleName"] as? String
            let service = services["\(serviceType)"]
            return createInstance(from: "\(appName ?? "").\(service ?? "")") as? T
        }
    }
}

fileprivate extension Container {
    func createInstance(from className: String) -> AnyObject? {
        if let classType = NSClassFromString(className) as? NSObject.Type {
            return classType.init()
        }
        return nil
    }
}
