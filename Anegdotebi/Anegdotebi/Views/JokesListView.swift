//
//  JokesListView.swift
//  Anegdotebi
//
//  Created by Barbare Tepnadze on 22.05.24.
//

import SwiftUI

struct JokesList: View {
    @Environment(\.colorScheme) var colorScheme
    
    let jokes: [String]
    @Binding var savedJokes: [String]
    
    var body: some View {
        List {
            ForEach(jokes, id: \.self) { joke in
                HStack(spacing: 17) {
                    CustomButton(text: "👍🏻", fontSize: 25, padding: 15) {
                        if let index = savedJokes.firstIndex(of: joke) {
                            savedJokes.remove(at: index)
                        } else {
                            savedJokes.append(joke)
                        }
                    }
                    .overlay(
                        Circle()
                            .stroke(savedJokes.contains(joke) ?
                                    (colorScheme == .light ? Color.darkStart.opacity(0.2) : Color.offWhite.opacity(0.3))
                                    : Color.clear,
                                    lineWidth: 3)
                            .blur(radius: 1)
                    )
                    VStack {
                        Text("***")
                            .titleTextStyle(fontSize: 20)
                        Text(joke)
                            .bodyTextStyle()
                    }
                }
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
        .customCardStyle(height: .infinity, leadingPadding: 0)
    }
}
