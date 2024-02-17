//
//  SegmentControl+Scroll.swift
//  NewsApp
//
//  Created by Дмитрий Цветков on 12.02.2024.
//

import SwiftUI

struct SegmentControl_Scroll: View {
    @State var segmentIndex = 0
    @State var framesForSegments: [CGRect] = Array<CGRect>(repeating: .zero, count: 20)
    
    var categories: [String] = []
    var selectedItemColor = Color.green
    var selectedItemFontColor = Color.brown
    var defaultItemColor = Color.gray
    var defaultItemFontColor = Color.black
    var backgroundOfSegmentControl = Color.gray
    
    init(categories: [String], selectedItemColor: SwiftUI.Color = Color.gray.opacity(0.7), selectedItemFontColor: SwiftUI.Color = Color.brown, defaultItemColor: SwiftUI.Color = Color.gray, defaultItemFontColor: SwiftUI.Color = Color.black, backgroundOfSegmentControl: SwiftUI.Color = Color.gray.opacity(0.1)) {

        self.categories = categories
        self.selectedItemColor = selectedItemColor
        self.selectedItemFontColor = selectedItemFontColor
        self.defaultItemColor = defaultItemColor
        self.defaultItemFontColor = defaultItemFontColor
        self.backgroundOfSegmentControl = backgroundOfSegmentControl
    }
    
    var body: some View {
        VStack {
            ZStack {
                HStack(spacing: 10) {
                    ForEach(categories.indices, id: \.self) { index in
                        Text(self.categories[index])
                            .foregroundStyle(index == segmentIndex ? defaultItemFontColor : selectedItemFontColor)
                            .onTapGesture {
                                self.segmentIndex = index
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background {
                                GeometryReader { geo in
                                    Color.clear.onAppear {
                                        self.setFrameForSegment(index: index, frame: geo.frame(in: .global))
                                    }
                                    
                                }
                            }
                    }
                }.background(alignment: .leading) {
                    Capsule()
                        .fill(selectedItemColor)
                        .frame(width: framesForSegments[segmentIndex].width, height: 50)
                        .offset(x: framesForSegments[segmentIndex].minX - framesForSegments[0].minX)
                }
                .padding(5)
            }
            .background(backgroundOfSegmentControl)
            .animation(.spring(), value: segmentIndex)
        }
        .cornerRadius(100)
    }
    
    private func setFrameForSegment(index: Int, frame: CGRect) {
        DispatchQueue.main.async {
            self.framesForSegments[index] = frame
        }
    }
}

#Preview {
    SegmentControl_Scroll(categories: ["One", "Two", "Three", "Thour", "Five", "Six"])
}
