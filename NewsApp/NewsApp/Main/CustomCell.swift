//
//  CustomCell.swift
//  NewsApp
//
//  Created by Дмитрий Цветков on 17.02.2024.
//

import SwiftUI

struct CustomCell: View {
    var item: Result
    
    var body: some View {
        VStack {
            Text(item.title ?? "Empty title")
                .font(.system(size: 20))
                
                .bold()
                .multilineTextAlignment(.center)
            HStack {
                if let creator = item.creator {
                    VStack {
                        ForEach(0..<creator.count) { index in
                            Text(creator[index])
                                .font(.subheadline)
                        }
                    }

                }
                Spacer()
                Text(item.pubDate ?? "Empty date")
                    .font(.subheadline)
            }
            Text(item.description ?? "Empty desciption")
                .italic()
        }
    }
}

