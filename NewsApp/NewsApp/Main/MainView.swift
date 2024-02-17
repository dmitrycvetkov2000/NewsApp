//
//  MainView.swift
//  NewsApp
//
//  Created by Дмитрий Цветков on 12.02.2024.
//

import SwiftUI

struct MainView: View {
    var news: News?
    @StateObject private var viewModel = MainViewModel.init()
    
    var categories: [String] {
        var listOfCategories: Set<String> = []
        news?.results?.forEach({ res in
            if let category = res.category?.first {
                listOfCategories.insert(category)
            }
        })
        return Array(listOfCategories)
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                SegmentControl_Scroll(categories: categories)
            }
            
            if let listNews = news?.results {
                List(listNews, id: \.description) { item in
                    
                    NavigationLink(destination: MainDetailView(item: item)) {
                        CustomCell(item: item)
                    }
                }
            }
        }
        Spacer()
    }
    
}
