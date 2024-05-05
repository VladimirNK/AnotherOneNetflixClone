//
//  MyListButton.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 03.05.2024.
//

import SwiftUI

struct MyListButton: View {
    
    //MARK: - Properties
    
    var isMyList: Bool = false
    var onButtonPressed: (() -> Void)?
    
    //MARK: - Body
    
    var body: some View {
        VStack(spacing: Space.xs) {
            buttonIcon
            
            Text("My List")
                .typography(.caption)
                .foregroundStyle(.appLightGray)
        }
        .foregroundStyle(.appWhite)
        .padding(Space.xs)
        .background(.appTransparent)
        .animation(.bouncy, value: isMyList)
        .onTapGesture {
            onButtonPressed?()
        }
    }
}

//MARK: - Subviews

extension MyListButton {
    
    private var buttonIcon: some View {
        ZStack {
            Image(systemName: .checkmarkIconString)
                .opacity(isMyList ? 1 : 0)
                .rotationEffect(Angle(degrees: isMyList ? 0 : 180))
            Image(systemName: .plusIconString)
                .opacity(isMyList ? 0 : 1)
                .rotationEffect(Angle(degrees: isMyList ? -180 : 0))
        }
        .typography(.title)
    }
}

//MARK: - Preview

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
