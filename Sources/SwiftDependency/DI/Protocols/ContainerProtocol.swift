//
//  ContainerProtocol.swift
//  SwiftDependency
//
//  Created by Francesco Stabile on 15/04/25.
//

protocol ContainerProtocol {
    func register<T>(_ serviceType: T.Type, component: Any, lifeCycle: LifeCycle)
    func resolve<T>(_ serviceType: T.Type, lifeCycle: LifeCycle) -> T?
}
