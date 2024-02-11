//
//  NewsModel.swift
//  NewsApp
//
//  Created by Дмитрий Цветков on 11.02.2024.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let news = try? JSONDecoder().decode(News.self, from: jsonData)

import Foundation

// MARK: - News
struct News: Codable {
    let status: String?
    let totalResults: Int?
    let results: [Result]?
    let nextPage: String?
}

// MARK: - Result
struct Result: Codable {
    let articleID, title: String?
    let link: String?
    let keywords, creator: [String]?
    let description: String?
    let pubDate: String?
    let imageURL: String?
    let sourceID: String?
    let sourceURL: String?
    let sourcePriority: Int?
    let country, category: [String]?
    let language: String?

    enum CodingKeys: String, CodingKey {
        case articleID = "article_id"
        case title, link, keywords, creator
        case description, pubDate
        case imageURL = "image_url"
        case sourceID = "source_id"
        case sourceURL = "source_url"
        case sourcePriority = "source_priority"
        case country, category, language
    }
}


