//
//  APIErrors.swift
//  NewsApp
//
//  Created by Дмитрий Цветков on 11.02.2024.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
