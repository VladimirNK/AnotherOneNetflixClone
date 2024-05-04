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
    
    @State private var showPopover: Bool = false
    var onRatingSelected: ((RateOption) -> Void)?
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: .thumbsUpIconString )
                .font(.title)
            
            Text("Rate")
                .font(.caption)
                .foregroundStyle(.appLightGray)
        }
        .foregroundStyle(.appWhite)
        .padding(8)
        .background(Color.black.opacity(0.001))
        .onTapGesture {
            showPopover.toggle()
        }
        .popover(isPresented: $showPopover) {
            ZStack {
                Color.appDarkGray.ignoresSafeArea()
                
                HStack(spacing: 12) {
                    ForEach(RateOption.allCases, id: \.self) {
                        rateButton(option: $0)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            }
            .presentationCompactAdaptation(.popover)
        }
    }
    
    private func rateButton(option: RateOption) -> some View {
        VStack(spacing: 8) {
            Image(systemName: option.iconName)
                .font(.title2)
            Text(option.title )
                .font(.caption)
        }
        .foregroundStyle(.appWhite)
        .padding(4)
        .background(Color.black.opacity(0.001))
        .onTapGesture {
            showPopover = false
            onRatingSelected?(option )
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        RateButton()
    }
    
}
