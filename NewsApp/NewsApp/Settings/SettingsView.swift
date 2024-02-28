//
//  SettingsView.swift
//  NewsApp
//
//  Created by Дмитрий Цветков on 19.02.2024.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel: SettingsViewModel = SettingsViewModel.init()
    @State var next: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer(minLength: 10)
                Text("Выберете язык новостей: ")
                Picker("", selection: $viewModel.selectedLanguage) {
                    ForEach(Languages.allCases, id: \.rawValue) {
                        Text($0.rawValue)
                    }
                }
                Spacer()
            }
            Button {
                next.toggle()

            } label: {
                NavigationLink(destination: LoadingView(language: $viewModel.selectedLanguage), isActive: $next) {
                    Text("Continue")
                }
            }

        }

    }
}

//#Preview {
//    SettingsView()
//}
