//
//  InjectProps.swift
//  SwiftDependency
//
//  Created by Francesco Stabile on 15/04/25.
//
@propertyWrapper
public struct InjectProps<T> {
    private let lifeCycle: LifeCycle

    @MainActor public var wrappedValue: T {
        get {
            guard let instance = Container.shared.resolve(T.self, lifeCycle: lifeCycle) else {
                fatalError("Dependency \(T.self) not found in Container")
            }
            return instance
        }
    }

    // Default a Singleton se non specificato
    public init() {
        self.lifeCycle = .singleton
    }

    // Permette di specificare il ciclo di vita come enum
    public init(_ lifeCycle: LifeCycle) {
        self.lifeCycle = lifeCycle
    }
}
