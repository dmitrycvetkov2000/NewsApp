//
//  LoadingView.swift
//  NewsApp
//
//  Created by Дмитрий Цветков on 11.02.2024.
//

import SwiftUI

struct LoadingView: View {
    
    @StateObject private var viewModel = LoadingViewModel.init()
    @Binding var language: String
    
    var body: some View {
        
        VStack {
            CustomSpinner()
            AnimatedTextLoadingIndicatorView.init(text: "Loading")
            
            NavigationLink(destination: MainView(news: viewModel.news), isActive: $viewModel.isFinishLoading) {
                EmptyView()
            }
        }
        .navigationBarHidden(true)
        .padding(22)
        .background(Color.gray.opacity(0.4))
        .cornerRadius(20)
        
        .task {
            do {
                viewModel.news = try await viewModel.getNewsData(language: language)
            } catch APIError.invalidData {
                print("invalidData")
            } catch APIError.invalidResponse {
                print("invalidResponse")
            } catch APIError.invalidURL {
                print("invalidURL")
            } catch {
                print("unexpected error")
            }
        }
    }
}


