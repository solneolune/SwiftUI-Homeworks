//
//  CustomCardModifier.swift
//  Anegdotebi
//
//  Created by Barbare Tepnadze on 22.05.24.
//

import SwiftUI

struct CustomCardModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    var height: CGFloat
    var leadingPadding: CGFloat
    var trailingPadding: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding(.leading, leadingPadding)
            .padding(.trailing, trailingPadding)
            .padding(.top, 12)
            .frame(width: .infinity, height: height)
            .backgroundGradient(for: colorScheme)
            .cornerRadius(18)
            .neumorphicShadow(for: colorScheme)
    }
}

extension View {
    func customCardStyle(height: CGFloat, leadingPadding: CGFloat = 16, trailingPadding: CGFloat = 0) -> some View {
        self.modifier(CustomCardModifier(height: height, leadingPadding: leadingPadding, trailingPadding: trailingPadding))
    }
}

