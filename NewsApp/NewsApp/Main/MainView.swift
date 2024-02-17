//
//  MainView.swift
//  NewsApp
//
//  Created by Дмитрий Цветков on 12.02.2024.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                SegmentControl_Scroll(categories: ["One", "Two", "Three", "Thour", "Five", "Six"])
            }
            
        }
        Spacer()
    }
    
}

#Preview {
    MainView()
}
