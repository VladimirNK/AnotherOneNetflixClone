//
//  MyListButton.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 03.05.2024.
//

import SwiftUI

struct MyListButton: View {
    
    var isMyList: Bool = false
    var onButtonPressed: (() -> Void)?
    
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Image(systemName: .checkmarkIconString)
                    .opacity(isMyList ? 1 : 0)
                    .rotationEffect(Angle(degrees: isMyList ? 0 : 180))
                Image(systemName: .plusIconString)
                    .opacity(isMyList ? 0 : 1)
                    .rotationEffect(Angle(degrees: isMyList ? -180 : 0))
            }
            .font(.title)
            
            Text("My List")
                .font(.caption)
                .foregroundStyle(.appLightGray)
        }
        .foregroundStyle(.appWhite)
        .padding(8)
        .background(Color.black.opacity(0.001))
        .animation(.bouncy, value: isMyList)
        .onTapGesture {
            onButtonPressed?()
        }
    }
}

fileprivate struct MyListButtonPreview: View {
    
    @State private var isMyList: Bool = false
    
    var body: some View {
        MyListButton(isMyList: isMyList) {
            isMyList.toggle()
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        MyListButtonPreview()
    }
    
}
