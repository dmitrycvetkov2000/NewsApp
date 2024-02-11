//
//  Injected.swift
//  NewsApp
//
//  Created by Дмитрий Цветков on 11.02.2024.
//

import Foundation

@propertyWrapper
struct Injected<Service> {
    private var service: Service?
    
    public var wrappedValue: Service? {
        mutating get {
            if service == nil {
                service = ServiceLocator.service()
            }
            return service
        }
    }
    
    public var projectedValue: Injected<Service> {
        mutating set {
            self = newValue
        }
        get {
            return self
        }
    }
}
