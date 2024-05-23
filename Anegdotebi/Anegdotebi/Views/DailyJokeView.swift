//
//  DailyJokeView.swift
//  Anegdotebi
//
//  Created by Barbare Tepnadze on 22.05.24.
//

import SwiftUI

struct DailyJokeView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var randomJoke = Skhartulebi.randomElement()!
    
    var body: some View {
        VStack {
            HStack {
                CustomButton(text: "🤪") {
                    randomJoke = Skhartulebi.randomElement()!
                }
                Spacer(minLength: 0)
            }
            Text("სხარტულები")
                .subtitleTextStyle()
            Spacer()
            Text(randomJoke)
                .bodyTextStyle(fontSize: 16)
            Spacer(minLength: 0)
        }
        .customCardStyle(height: 232, trailingPadding: 16)
    }
}
