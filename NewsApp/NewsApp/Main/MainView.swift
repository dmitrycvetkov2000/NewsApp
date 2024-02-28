//
//  MainView.swift
//  NewsApp
//
//  Created by Дмитрий Цветков on 12.02.2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel = MainViewModel.init()
    @State var segmentIndex = 0
    @State var curCategory = ""
    
    var news: News?
    
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
            HStack {
                Spacer()
                NavigationLink(destination: SettingsView.init()) {
                    Image("settings", label: Text("")).resizable()
                }.frame(width: 30, height: 30)
            }.padding([.top, .trailing], 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                segmentControl
                    .onAppear {
                        curCategory = segmentControl.categories[segmentIndex]
                    }
                    .onChange(of: segmentIndex) {
                        curCategory = segmentControl.categories[segmentIndex]
                    }
                
            }
            
            if let listNews = news?.results {
                List(listNews, id: \.title) { item in
                    if let _ = item.title, let categoriesItem = item.category {
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
        .onDisappear {
            curCategory = ""
            segmentIndex = 0
        }
        Spacer()
    }
    
}
