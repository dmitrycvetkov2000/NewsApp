//
//  NewsService.swift
//  NewsApp
//
//  Created by Дмитрий Цветков on 11.02.2024.
//

import Foundation

protocol NewsServiceProtocol {
    func getNewsData() async throws -> News
}

final class NewsService: NewsServiceProtocol {
    
    func getNewsData() async throws -> News {
        
        let strURL = "https://newsdata.io/api/1/news?apikey=pub_139265749605a665e5fa1de2b12a689cbc510"
        
        guard let url = URL(string: strURL) else { throw APIError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw APIError.invalidResponse }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            //sleep(10)
            return try decoder.decode(News.self, from: data)
        } catch {
            throw APIError.invalidData
        }
    }
    
}
