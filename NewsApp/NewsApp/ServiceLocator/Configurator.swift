//
//  Configurator.swift
//  NewsApp
//
//  Created by Дмитрий Цветков on 11.02.2024.
//

import Foundation

final class Configurator {
    static let shared = Configurator()
    
    private init() {}
    
    func setup() {
        setupNewsService()
    }
    
    private func setupNewsService() {
        let newsService: NewsServiceProtocol = NewsService()
        ServiceLocator.addService(newsService)
    }
}
