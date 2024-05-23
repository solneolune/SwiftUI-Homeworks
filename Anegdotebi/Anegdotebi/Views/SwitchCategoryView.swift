//
//  SwitchCategoryView.swift
//  Anegdotebi
//
//  Created by Barbare Tepnadze on 22.05.24.
//

import SwiftUI

struct SwitchCategoryView: View {
    @Binding var currentCategoryIndex: Int
    let categoryNames: [String]
    let imageNames: [String]
    
    var body: some View {
        VStack {
            HStack(spacing: 5) {
                CustomButton(text: "👈🏻") {
                    currentCategoryIndex = (currentCategoryIndex - 1 + categoryNames.count) % categoryNames.count
                }
                CustomButton(text: "👉🏻") {
                    currentCategoryIndex = (currentCategoryIndex + 1) % categoryNames.count
                }
                Spacer(minLength: 0)
            }
            Text(categoryNames[currentCategoryIndex])
                .subtitleTextStyle()
            Spacer()
        }
        .customCardStyle(height: 110)
        .overlay(
            Image(imageNames[currentCategoryIndex])
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 90)
                .padding([.bottom, .trailing], 0),
            alignment: .bottomTrailing
        )
    }
}
