//
//  CustomButton.swift
//  Anegdotebi
//
//  Created by Barbare Tepnadze on 22.05.24.
//

import SwiftUI

struct CustomButton: View {
    var text: String
    var fontSize: CGFloat?
    var padding: CGFloat?
    var useInboxStyle: Bool = false
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            if useInboxStyle {
                Text(text)
                    .inboxButtonStyle(fontSize: fontSize ?? 25, padding: padding ?? 7)
            } else {
                Text(text)
                    .customButtonStyle(fontSize: fontSize ?? 25, padding: padding ?? 7)
            }
        }
    }
}
