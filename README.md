
# Swift Dependency Injection

Un modulo leggero e flessibile per la Dependency Injection in Swift, che supporta diversi cicli di vita per le dipendenze.

## Caratteristiche Principali

- 💉 Dependency Injection semplice e type-safe
- 🔄 Supporto per diversi cicli di vita (Singleton, Scoped, Transient)
- 🎯 Property Wrapper per una facile iniezione delle dipendenze
- 📦 Container centralizzato per la gestione delle dipendenze
- 🔒 Thread-safe con supporto per `@MainActor`


## Installazione

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/FraStabile/SwiftDependency.git", from: "1.0.0")
]
```

## Utilizzo

### Registrazione delle Dipendenze

```swift
// Registrazione di un singleton
Container.shared.register(ServiceProtocol.self, component: ServiceImplementation(), lifeCycle: .singleton)

// Registrazione di un servizio scoped
let context = Context()
Container.shared.register(ServiceProtocol.self, component: ServiceImplementation(), lifeCycle: .scoped(context))

// Registrazione di un servizio transient
Container.shared.register(ServiceProtocol.self, component: ServiceImplementation(), lifeCycle: .transient)
```

### Iniezione delle Dipendenze

```swift
class MyClass {
    // Iniezione di un singleton
    @InjectProps private var service: ServiceProtocol

    // Iniezione con ciclo di vita specifico
    @InjectProps(.scoped(ScopedContext.main)) private var scopedService: ServiceProtocol
    @InjectProps(.transient) private var transientService: ServiceProtocol
}
```

## Cicli di Vita Supportati

### Singleton
- Una singola istanza condivisa per l'intera applicazione
- Ideale per servizi stateless o che necessitano di essere condivisi globalmente

### Scoped
- Istanze limitate a un contesto specifico
- Utile per feature modules o flussi di navigazione
- Possibilità di reset del contesto

### Transient
- Nuova istanza creata ad ogni risoluzione
- Perfetto per oggetti che necessitano di stato isolato

## API Reference

### Container

```swift
func register<T>(serviceType: T.Type, component: Any, lifeCycle: LifeCycle)
func resolve<T>(serviceType: T.Type, lifeCycle: LifeCycle) -> T?
```

### Context

```swift
func register<T>(serviceType: T.Type, component: Any)
func resolve<T>(serviceType: T.Type) -> T?
func resetAll()
```

### Property Wrapper

```swift
@InjectProps var service: ServiceType
@InjectProps(lifeCycle: LifeCycle) var service: ServiceType
```

## Best Practices

1. Registra le dipendenze all'avvio dell'applicazione.
2. Usa `.singleton` per servizi stateless.
3. Utilizza `.scoped` per isolare le dipendenze in specifici moduli.
4. Implementa il pattern Protocol-Oriented per una migliore testabilità.
5. Resetta i contesti scoped quando necessario per evitare memory leaks.

## Thread Safety

Il modulo è thread-safe grazie all'utilizzo di `@MainActor` per le operazioni critiche. Il container condiviso e i contesti scoped sono gestiti in modo sicuro sul thread principale.

## Requisiti

- iOS 13.0+
- Swift 5.5+
- Xcode 13.0+

## Licenza

Questo progetto è distribuito sotto licenza MIT. Vedere il file `LICENSE` per maggiori dettagli.

## Autore

Francesco Stabile
