//
//  RateButton.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 03.05.2024.
//

import SwiftUI

enum RateOption: String, CaseIterable {
    case dislike, like, love
    
    var title: String {
        switch self {
        case .dislike:
            return "Not for me"
        case .like:
            return "I like this"
        case .love:
            return "Love this!"
        }
    }
    
    var iconName: String {
        switch self {
        case .dislike:
            return .thumbsDownIconString
        case .like:
            return .thumbsUpIconString
        case .love:
            return .loveIconString
        }
    }
}

struct RateButton: View {
    
    //MARK: - Properties
    
    @State private var showPopover: Bool = false
    var onRatingSelected: ((RateOption) -> Void)?
    
    //MARK: - Body
    
    var body: some View {
        VStack(spacing: Space.xs) {
            Image(systemName: .thumbsUpIconString)
                .typography(.title)
            
            Text("Rate")
                .typography(.caption)
                .foregroundStyle(.appLightGray)
        }
        .foregroundStyle(.appWhite)
        .padding(Space.xs)
        .background(.appTransparent)
        .onTapGesture {
            showPopover.toggle()
        }
        .popover(isPresented: $showPopover) {
            ZStack {
                Color.appDarkGray.ignoresSafeArea()
                popoverContent
            }
            .presentationCompactAdaptation(.popover)
        }
    }
}

//MARK: - Subviews

extension RateButton {
    
    private func rateButton(option: RateOption) -> some View {
        VStack(spacing: Space.xs) {
            Image(systemName: option.iconName)
                .typography(.title2)
            Text(option.title )
                .typography(.caption)
        }
        .foregroundStyle(.appWhite)
        .padding(Space.xs2)
        .background(.appTransparent)
        .onTapGesture {
            showPopover = false
            onRatingSelected?(option)
        }
    }
    
    private var popoverContent: some View {
        HStack(spacing: Space.s) {
            ForEach(RateOption.allCases, id: \.self) {
                rateButton(option: $0)
            }
        }
        .padding(.horizontal, Space.m)
        .padding(.vertical, Space.xs)
    }
}

//MARK: - Preview

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        RateButton()
    }
}
