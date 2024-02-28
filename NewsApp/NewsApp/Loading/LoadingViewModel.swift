//
//  LoadingViewModel.swift
//  NewsApp
//
//  Created by Дмитрий Цветков on 11.02.2024.
//

import SwiftUI

final class LoadingViewModel: ObservableObject {
    @Injected var newsService: NewsServiceProtocol?
    @Published var isFinishLoading: Bool = false
    var news: News?
    
    func getNewsData(language: String) async throws -> News? {
        let news = try await newsService?.getNewsData(language: language)
        DispatchQueue.main.async {
            self.isFinishLoading = true
        }
        return news
    }
}



