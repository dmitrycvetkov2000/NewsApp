//
//  ServiceLocator.swift
//  NewsApp
//
//  Created by Дмитрий Цветков on 11.02.2024.
//

import Foundation

protocol ServiceLocatorProtocol {
    func service<T>() -> T?
}

final class ServiceLocator: ServiceLocatorProtocol {
    private static let instance = ServiceLocator()
    private lazy var services: [String: Any] = [:]
    
    class func service<T>() -> T? {
        return instance.service()
    }
    
    class func addService<T>(_ service: T) {
        return instance.addService(service)
    }
    
    class func clear() {
        instance.services.removeAll()
    }
    
    class func removeService<T>(_ service: T) {
        instance.removeService(service)
    }
    
    func service<T>() -> T? {
        let key = typeName(T.self)
        return services[key] as? T
    }
    
    private func addService<T>(_ service: T) {
        let key = typeName(T.self)
        services[key] = service
    }
    
    private func removeService<T>(_ service: T) {
        let key = typeName(T.self)
        services.removeValue(forKey: key)
    }
    
    private func typeName(_ some: Any) -> String {
        return (some is Any.Type) ? "\(some)" : "\(type(of: some))"
    }
}
