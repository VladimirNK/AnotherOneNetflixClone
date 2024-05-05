//
//  PrimaryButtonStyle.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 01.05.2024.
//

import SwiftUI

struct MainButtonStyleViewModifier: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.8 : 1)
    }
}

enum MainButtonType {
    case primary
    case secondary
    
    var backgroundColor: Color {
        switch self {
        case .primary:
            return .appWhite
        case .secondary:
            return .appDarkGray
        }
    }
    
    var textColor: Color {
        switch self {
        case .primary:
            return .appDarkGray
        case .secondary:
            return .appWhite
        }
    }
}
