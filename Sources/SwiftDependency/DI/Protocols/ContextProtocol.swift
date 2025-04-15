//
//  ContextProtocol.swift
//  SwiftDependency
//
//  Created by Francesco Stabile on 15/04/25.
//

protocol ContextProtocol {
    func resetAll()
    func register<T>(_ serviceType: T.Type, component: Any)
    func resolve<T>(_ serviceType: T.Type) -> T?
}
