//
//  AdlerySwashText.swift
//  EveryDay
//
//  Created by Dzianis Selivanau on 19.06.22.
//

import SwiftUI

struct AdlerySwashText: View {
    
    let title: String
    let size: CGFloat
    let foregroundColor: Color
    
    init(title: String, size: CGFloat, foregroundColor: Color) {
        self.title = title
        self.size = size
        self.foregroundColor = foregroundColor
        
    }
    
    var body: some View {
        Text(title)
            .font(.custom("AdleryPro-Swash", size: size))
            .foregroundColor(foregroundColor)
    }
}
