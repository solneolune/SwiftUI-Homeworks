//
//  CustomTextModifier.swift
//  Anegdotebi
//
//  Created by Barbare Tepnadze on 22.05.24.
//

import SwiftUI

// MARK: - Modifiers
struct TitleTextModifier: ViewModifier {
    var fontSize: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.custom("BPG Nino Mtavruli Bold", size: fontSize))
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.primary)
    }
}

struct SubtitleTextModifier: ViewModifier {
    var fontSize: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.custom("BPG Nino Mtavruli", size: fontSize))
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.primary)
            .padding(.top, 10)
    }
}

struct BodyTextModifier: ViewModifier {
    var fontSize: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.custom("BPG Nino Mtavruli Book", size: fontSize))
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.primary)
            .lineSpacing(4)
            .tracking(0.5)
    }
}

struct CenterTitleModifier: ViewModifier {
    var fontSize: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.custom("BPG Nino Mtavruli Bold", size: fontSize))
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundColor(.primary)
            .multilineTextAlignment(.center)
    }
}

struct SecondaryTextModifier: ViewModifier {
    var fontSize: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.custom("BPG Nino Mtavruli Book", size: fontSize))
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundColor(.secondary)
            .lineSpacing(4)
            .tracking(0.5)
            .multilineTextAlignment(.center)
    }
}

// MARK: - Extension
extension View {
    func titleTextStyle(fontSize: CGFloat = 34) -> some View {
        self.modifier(TitleTextModifier(fontSize: fontSize))
    }
    
    func subtitleTextStyle(fontSize: CGFloat = 14) -> some View {
        self.modifier(SubtitleTextModifier(fontSize: fontSize))
    }
    
    func bodyTextStyle(fontSize: CGFloat = 14) -> some View {
        self.modifier(BodyTextModifier(fontSize: fontSize))
    }
    
    func centerTitleStyle(fontSize: CGFloat = 34) -> some View {
        self.modifier(CenterTitleModifier(fontSize: fontSize))
    }
    
    func secondaryTextStyle(fontSize: CGFloat = 14) -> some View {
        self.modifier(SecondaryTextModifier(fontSize: fontSize))
    }
}
