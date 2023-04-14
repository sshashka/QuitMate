//
//  GlowEffectSwiftUI.swift
//  QuitMate
//
//  Created by Саша Василенко on 20.02.2023.
//

import SwiftUI
struct GlowEffect: ViewModifier {
    var color: Color
    var radius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .shadow(color: color, radius: radius)
            .overlay(
                content
                    .blur(radius: radius)
                    .colorMultiply(color)
            )
    }
}

extension View {
    func glow(color: Color, radius: CGFloat) -> some View {
        self.modifier(GlowEffect(color: color, radius: radius))
    }
}

