//
//  Context.swift
//  SwiftDependency
//
//  Created by Francesco Stabile on 31/01/25.
//


public class Context: ContextProtocol {
    
    
    public init() { }
    
    public var services: [String: Any] = [:]
    
    public func register<T>(_ serviceType: T.Type, component: Any) {
        services["\(serviceType)"] = component
    }
    
    public func resolve<T>(_ serviceType: T.Type) -> T? {
        return services["\(serviceType)"] as? T
    }
    
    public func resetAll() {
        services = [:]
    }
}
