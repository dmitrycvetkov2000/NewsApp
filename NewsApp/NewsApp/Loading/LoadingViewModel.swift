//
//  LoadingViewModel.swift
//  NewsApp
//
//  Created by Дмитрий Цветков on 11.02.2024.
//

import Foundation

final class LoadingViewModel: ObservableObject {
    @Injected var newsService: NewsServiceProtocol?
    @Published var news: News?
    
    func getNewsData() async throws -> News? {
        
        let news = try await newsService?.getNewsData()
        return news
    }
}



