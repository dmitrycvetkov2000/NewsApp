//
//  CustomSpinner.swift
//  NewsApp
//
//  Created by Дмитрий Цветков on 11.02.2024.
//

import SwiftUI

struct CustomSpinner: View {
    @State var animate = false
    
    var body: some View {
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(AngularGradient.init(gradient: .init(colors: [.brown, .gray]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/), style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .frame(width: 45, height: 45)
                .rotationEffect(.init(degrees: self.animate ? 360 : 0))
                .animation(.linear(duration: 0.7).repeatForever(autoreverses: false), value:  self.animate)
        .onAppear {
            DispatchQueue.main.async {
                self.animate.toggle()
            }
            
        }

    }
}

#Preview {
    CustomSpinner()
}
