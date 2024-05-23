//
//  ContentView.swift
//  Anegdotebi
//
//  Created by Barbare Tepnadze on 22.05.24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var currentCategoryIndex = 0
    @State private var savedJokes: [String] = []
    
    private let categories = [
        ("კახელები", "Kakheli", Kakhelebi),
        ("იმერლები", "Imereli", Imerlebi),
        ("სვანები", "Svani", Svanebi),
        ("მეგრელები", "Megreli", Megrelebi),
        ("რაჭველები", "Rachveli", Rachvelebi),
        ("გურულები", "Guruli", Gurulebi)
    ]
    
    var body: some View {
        ZStack {
            Color.clear
                .backgroundGradient(for: colorScheme)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("ჭ3პ3ტ3 იუმ2ნა")
                    .titleTextStyle()
                    .padding(.leading, 18)
                HStack(spacing: 13) {
                    DailyJokeView()
                    VStack(spacing: 12) {
                        ModeView()
                        SwitchCategoryView(currentCategoryIndex: $currentCategoryIndex, categoryNames: categories.map { $0.0 }, imageNames: categories.map { $0.1 })
                    }
                }
                .padding(.leading, 9)
                .padding(.trailing, 23)
                JokesList(jokes: categories[currentCategoryIndex].2, savedJokes: $savedJokes)
                    .padding(.top, 30)
                    .padding(.leading, 9)
                    .padding(.trailing, 23)
                    .edgesIgnoringSafeArea(.bottom)
            }
            DraggableButton(savedJokes: $savedJokes)
        }
    }
}
