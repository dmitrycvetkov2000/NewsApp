//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Дмитрий Цветков on 11.02.2024.
//

import SwiftUI

@main
struct NewsAppApp: App {
    
    init() {
        Configurator.shared.setup() // Настройка сервисов
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }
    }
}
