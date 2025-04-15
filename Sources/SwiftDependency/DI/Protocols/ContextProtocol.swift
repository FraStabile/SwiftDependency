//
//  ContextProtocol.swift
//  SwiftDependency
//
//  Created by Francesco Stabile on 31/01/25.
//

protocol ContextProtocol {
    func resetAll()
    func register<T>(_ serviceType: T.Type, component: Any)
    func resolve<T>(_ serviceType: T.Type) -> T?
}
