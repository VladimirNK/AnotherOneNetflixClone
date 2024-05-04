//
//  DetailsProductViewButton.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 04.05.2024.
//

import SwiftUI

struct DetailsProductViewButton: View {
    
    var iconString: String
    var action: (() -> Void)?
    
    var body: some View {
        Circle()
            .fill(.appDarkGray)
            .overlay(
                Image(systemName: iconString)
                    .foregroundStyle(.appWhite)
                    .font(.subheadline)
            )
            .frame(size: Size.xl4)
            .onTapGesture {
                action?()
            }
    }
}

#Preview {
    DetailsProductViewButton(iconString: .tvBadgeWifiIconString)
}
