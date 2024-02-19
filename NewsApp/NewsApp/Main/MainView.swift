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
    @State var segmentIndex = 0
    @State var curCategory = ""
    
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
        let segmentControl = SegmentControl_Scroll(categories: categories, segmentIndex: $segmentIndex)
        
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                segmentControl
                    .onAppear {
                        curCategory = segmentControl.categories[segmentIndex]
                    }
                    .onChange(of: segmentIndex) {
                        curCategory = segmentControl.categories[segmentIndex]
                        print("curCategory = \(curCategory)")
                    }

            }
            
            if let listNews = news?.results {
                List(listNews, id: \.description) { item in
                    if let categoriesItem = item.category {
                        if categoriesItem.contains(curCategory) {
                            NavigationLink(destination: MainDetailView(item: item)) {
                                CustomCell(item: item)
                            }
                        }
                    }
                }
            }
        }
        .toolbar(.hidden)
        Spacer()
    }
    
}
