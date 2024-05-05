//
//  MainButton.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 01.05.2024.
//

import SwiftUI

struct MainButton: View {
    
    //MARK: - Properties
    
    var text: String
    var buttonType: MainButtonType
    var iconString: String?
    var onTap: (() -> Void)?
    
    //MARK: - Body
    
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
                        .typography(.callout)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, Space.xs)
                .padding(.horizontal, Space.m)
                .foregroundStyle(buttonType.textColor)
                .background(buttonType.backgroundColor)
                .cornerRadius(CornerRadius.xs)
            }
        )
        .buttonStyle(MainButtonStyleViewModifier())
    }
}

//MARK: - Preview

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack(spacing: Space.m) {
            MainButton(text: "Play", buttonType: .primary, iconString: .playIconString)
            MainButton(text: "My List", buttonType: .secondary, iconString: .plusIconString)
        }
        .padding(Space.m)
    }
}
