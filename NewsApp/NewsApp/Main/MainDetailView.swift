//
//  MainDetailView.swift
//  NewsApp
//
//  Created by Дмитрий Цветков on 17.02.2024.
//

import SwiftUI

struct MainDetailView: View {
    var item: Result
    var body: some View {
        ScrollView {
            VStack {
                if let imageURL = item.imageURL {
                    let url = URL(string: imageURL)
                    AsyncImage(url: url)
                }
                Text(item.title ?? "Empty title")
                    .font(.title)
                    .bold()
                
                VStack(alignment: .trailing) {
                    if let creator = item.creator {
                        ForEach(0..<creator.count) { index in
                            Text("Авторы: \(creator[index])")
                                .font(.subheadline)
                        }
                    }
                    Text("Дата публикации: \(item.pubDate ?? "Empty date")")
                        .font(.subheadline)
                    Text("Язык публикации: \(item.language ?? "Empty language")")
                    if let countries = item.country {
                        ForEach(0..<countries.count) { index in
                            Text("Страны: \(countries[index])")
                                .font(.subheadline)
                        }
                        
                    }
                    
                    if let categories = item.category {
                        ForEach(0..<categories.count) { index in
                            Text("Категории: \(categories[index])")
                                .font(.subheadline)
                        }
                        
                    }
                    
                    if let keywords = item.keywords {
                        ForEach(0..<keywords.count) { index in
                            Text("Ключевые слова: \(keywords[index])")
                                .font(.subheadline)
                        }
                        
                    }
                }
                
                let link = "[Ссылка на статью](\(item.link ?? ""))"
                Text(.init(link))
                
                Text(item.description ?? "Empty description")
            }
        }

    }
}


