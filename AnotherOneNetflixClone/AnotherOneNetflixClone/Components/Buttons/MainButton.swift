//
//  MainButton.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 01.05.2024.
//

import SwiftUI

struct MainButton: View {
    
    var text: String
    var buttonType: MainButtonType
    var iconString: String?
    var onTap: (() -> Void)?
    
    var body: some View {
        Button(
            action: { onTap?() },
            label: {
                HStack {
                    if let iconString {
                        Image(systemName: iconString)
                    }
                    
                    Text(text)
                        .fontWeight(.medium)
                        .font(.callout)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .foregroundStyle(buttonType.textColor)
                .background(buttonType.backgroundColor)
                .cornerRadius(4)
            }
        )
        .buttonStyle(MainButtonStyleViewModifier())
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack(spacing: 20) {
            MainButton(text: "Play", buttonType: .primary, iconString: .playIconString)
            MainButton(text: "My List", buttonType: .secondary, iconString: .plusIconString)
        }
        .padding(16)
        
    }
    
}
