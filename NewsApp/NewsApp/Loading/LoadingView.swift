//
//  LoadingView.swift
//  NewsApp
//
//  Created by Дмитрий Цветков on 11.02.2024.
//

import SwiftUI

struct LoadingView: View {

    @StateObject private var viewModel = LoadingViewModel.init()
    
    var body: some View {
        
            VStack {
                CustomSpinner()
                AnimatedTextLoadingIndicatorView.init(text: "Loading \(viewModel.news?.results?.count ?? -11)")

                NavigationLink(destination: MainView(), isActive: $viewModel.isFinishLoading) {
                    EmptyView()
                }
            }
            .padding(22)
            .background(Color.gray.opacity(0.4))
            .cornerRadius(20)
            
            .task {
                do {
                    viewModel.news = try await viewModel.getNewsData()
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

#Preview {
    LoadingView()
}

