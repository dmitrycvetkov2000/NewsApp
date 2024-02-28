//
//  SettingsViewModel.swift
//  NewsApp
//
//  Created by Дмитрий Цветков on 25.02.2024.
//

import SwiftUI

enum Languages: String, CaseIterable {
    case en = "en"
    case ru = "ru"
    case de = "de"
    case jp = "jp"
    case cn = "cn"
}

class SettingsViewModel: ObservableObject {
    //var languages = ["ru", "en", "de", "jp", "cn"]
    @Published var selectedLanguage: String = Languages.en.rawValue
}
