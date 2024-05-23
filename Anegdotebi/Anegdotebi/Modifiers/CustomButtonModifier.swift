//
//  CustomButtonModifier.swift
//  Anegdotebi
//
//  Created by Barbare Tepnadze on 22.05.24.
//

import SwiftUI

struct CustomButtonModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    var fontSize: CGFloat
    var padding: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: fontSize))
            .padding(padding)
            .buttonBackgroundColor(for: colorScheme)
    }
}

struct InboxButtonModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    var fontSize: CGFloat
    var padding: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: fontSize))
            .padding(padding)
            .background(
                Circle()
                    .fill(colorScheme == .light ? Color.darkBackgroundGradient : Color.lightBackgroundGradient)
            )
    }
}

extension View {
    func customButtonStyle(fontSize: CGFloat = 25, padding: CGFloat = 7) -> some View {
        self.modifier(CustomButtonModifier(fontSize: fontSize, padding: padding))
    }
    
    func inboxButtonStyle(fontSize: CGFloat = 25, padding: CGFloat = 7) -> some View {
        self.modifier(InboxButtonModifier(fontSize: fontSize, padding: padding))
    }
}


