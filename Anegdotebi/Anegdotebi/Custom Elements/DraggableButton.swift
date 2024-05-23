//
//  DraggableButton.swift
//  Anegdotebi
//
//  Created by Barbare Tepnadze on 22.05.24.
//

// 🥲 ნუბი ვარ ამისთვის, მაგრამ შორს მქონდა შეტოპილი უკვე

import SwiftUI

struct DraggableButton: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var offset: CGSize = .zero
    @State private var lastOffset: CGSize = .zero
    @State private var isDragging = false
    @State private var showDataView = false
    @State private var allowTap = true
    @Binding var savedJokes: [String]
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        let initialOffset = CGSize(width: screenWidth / 2 - 10 - 50, height: screenHeight / 2 - 69 - 50)
        
        let dragGesture = DragGesture()
            .onChanged { value in
                if isDragging {
                    withAnimation(.spring()) {
                        let newOffset = CGSize(width: lastOffset.width + value.translation.width, height: lastOffset.height + value.translation.height)
                        offset = CGSize(
                            width: min(max(newOffset.width, -screenWidth / 2 + 50), screenWidth / 2 - 50),
                            height: min(max(newOffset.height, -screenHeight / 2 + 50), screenHeight / 2 - 50)
                        )
                    }
                }
            }
            .onEnded { value in
                if isDragging {
                    lastOffset = offset
                    isDragging = false
                    allowTap = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        allowTap = true
                    }
                }
            }
        
        return ZStack {
            if showDataView {
                Rectangle()
                    .fill(Color.black.opacity(0.5))
                    .edgesIgnoringSafeArea(.all)
                    .zIndex(0)
            }
            Button(
                action: {
                    if allowTap {
                        if showDataView {
                            withAnimation(.easeInOut) {
                                showDataView = false
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                withAnimation(.spring()) {
                                    offset = lastOffset
                                }
                            }
                        } else {
                            withAnimation(.spring()) {
                                offset = CGSize(width: screenWidth / 2 - 10 - 50, height: -screenHeight / 2 + 69 + 50)
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                withAnimation(.easeInOut) {
                                    showDataView = true
                                }
                            }
                        }
                    }
                }
            ) {
                Group {
                    if showDataView {
                        Text("💾")
                            .customButtonStyle(fontSize: 30, padding: 20)
                            .transition(.opacity)
                    } else {
                        Text("💾")
                            .inboxButtonStyle(fontSize: 30, padding: 20)
                            .transition(.opacity)
                    }
                }
                .overlay(
                    Circle()
                        .stroke(Color.white.opacity(0.5), lineWidth: 4)
                        .blur(radius: 1)
                )
            }
            .animation(.easeInOut(duration: 0.3)) // value-იანი ანიმაცია არ მუშაობდა რატომღაც
            .frame(width: 100, height: 100)
            .contentShape(Rectangle())
            .offset(offset)
            .onAppear {
                offset = initialOffset
                lastOffset = initialOffset
            }
            .onLongPressGesture(minimumDuration: 0.05) {
                isDragging = true
            }
            .simultaneousGesture(dragGesture)
            
            if showDataView {
                Rectangle()
                    .fill(colorScheme == .light ? Color.lightBackgroundGradient : Color.darkBackgroundGradient)
                    .frame(width: 280, height: 500)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .overlay(
                        VStack {
                            Text("ზარდახშა")
                                .centerTitleStyle()
                                .padding(.top, 20)
                            if savedJokes.isEmpty {
                                Text("ზარდახშა ცარიელია. ფავორიტი ანეკდოტების შესანახად მოიწონე ისინი.")
                                    .secondaryTextStyle(fontSize: 16)
                                    .padding(20)
                            } else {
                                List {
                                    ForEach(savedJokes, id: \.self) { joke in
                                        VStack {
                                            Text("***")
                                                .titleTextStyle(fontSize: 20)
                                            Text(joke)
                                                .padding(3)
                                        }
                                        .listRowBackground(Color.clear)
                                    }
                                }
                                .listStyle(PlainListStyle())
                                .padding(5)
                            }
                        }
                    )
                    .transition(.opacity)
                    .zIndex(1)
            }
        }
    }
}
