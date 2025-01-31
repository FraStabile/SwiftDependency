//
//  HoContainer.swift
//  Vodafone LEAN
//
//  Created by Francesco Stabile on 30/01/25.
//  Copyright © 2025 NTT DATA. All rights reserved.
//

protocol ContainerProtocol {
    func register<T>(_ serviceType: T.Type, component: Any, lifeCycle: LifeCycle)
    func resolve<T>(_ serviceType: T.Type, lifeCycle: LifeCycle) -> T?
}
