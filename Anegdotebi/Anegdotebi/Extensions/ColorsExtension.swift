//
//  ColorsExtension.swift
//  Anegdotebi
//
//  Created by Barbare Tepnadze on 22.05.24.
//

import SwiftUI

extension Color {
    // MARK: - Color Variables
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
    
    // MARK: - Gradients
    static var lightBackgroundGradient: LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [Color.offWhite, Color.offWhite]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    static var darkBackgroundGradient: LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [Color.darkStart, Color.darkEnd]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

// MARK: - Computed Properties
extension View {
    @ViewBuilder
    func backgroundGradient(for colorScheme: ColorScheme) -> some View {
        switch colorScheme {
        case .light:
            self.background(Color.lightBackgroundGradient)
        case .dark:
            self.background(Color.darkBackgroundGradient)
        @unknown default:
            self.background(Color.lightBackgroundGradient)
        }
    }
    
    @ViewBuilder
    func neumorphicShadow(for colorScheme: ColorScheme) -> some View {
        switch colorScheme {
        case .light:
            self
                .shadow(color: Color.black.opacity(0.1), radius: 6, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 6, x: -5, y: -5)
        case .dark:
            self
                .shadow(color: Color.black.opacity(0.6), radius: 6, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.1), radius: 6, x: -5, y: -5)
        @unknown default:
            self
                .shadow(color: Color.black.opacity(0.1), radius: 6, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 6, x: -5, y: -5)
        }
    }
    
    @ViewBuilder
    func buttonBackgroundColor(for colorScheme: ColorScheme) -> some View {
        switch colorScheme {
        case .light:
            self.background(
                Circle()
                    .fill(Color.lightBackgroundGradient)
                    .neumorphicShadow(for: colorScheme)
                    .blur(radius: 1)
            )
        case .dark:
            self.background(
                Circle()
                    .fill(Color.darkBackgroundGradient)
                    .neumorphicShadow(for: colorScheme)
                    .blur(radius: 1)
            )
        @unknown default:
            self.background(
                Circle()
                    .fill(Color.lightBackgroundGradient)
                    .neumorphicShadow(for: colorScheme)
                    .blur(radius: 1)
            )
        }
    }
}
