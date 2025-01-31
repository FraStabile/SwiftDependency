//
//
//  Created by Francesco Stabile on 30/01/25.
//

protocol ContainerProtocol {
    func register<T>(_ serviceType: T.Type, component: Any, lifeCycle: LifeCycle)
    func resolve<T>(_ serviceType: T.Type, lifeCycle: LifeCycle) -> T?
}
