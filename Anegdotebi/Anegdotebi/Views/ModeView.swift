//
//  ModeView.swift
//  Anegdotebi
//
//  Created by Barbare Tepnadze on 22.05.24.
//

import SwiftUI

struct ModeView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            HStack {
                CustomButton(text: isDarkMode ? "🕯️" : "💡") {
                    isDarkMode.toggle()
                }
                Spacer(minLength: 0)
            }
            Text(isDarkMode ? "შუქი ჩაქვრა" : "შუქი მოვიდა")
                .subtitleTextStyle()
            Spacer()
        }
        .customCardStyle(height: 110)
    }
}
