//
//  AnimatedTextLoadingIndicatorView.swift
//  NewsApp
//
//  Created by Дмитрий Цветков on 11.02.2024.
//

import SwiftUI

struct AnimatedTextLoadingIndicatorView: View {
    private var text: String = ""
    @State private var dots: String = ""
    private let now: Date = .now
    private static let every: TimeInterval = 0.4
    private let timer = Timer.publish(every: Self.every, on: .main, in: .common).autoconnect()

    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        HStack {
            Text(self.text)
                .font(.title)
                .bold()
                .transition(.slide)
                .overlay {
                    GeometryReader { geo in
                        Text(dots)
                            .font(.title)
                            .bold()
                            .fontWeight(.heavy)
                            .offset(x: geo.size.width + 2)
                    }
                }
        }
        .padding(10)
        .onReceive(timer) { time in
            let tick: Int = .init(time.timeIntervalSince(now) / Self.every) - 1
            
            let count: Int = tick % 4
            dots = String(Array(repeating: ".", count: count))
        }
        .onDisappear {
            timer.upstream.connect().cancel()
        }
    }
}
