/// MARK: - Property Wrappers per il ciclo di vita

/// MARK: - Property Wrapper principale InjectProps

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
