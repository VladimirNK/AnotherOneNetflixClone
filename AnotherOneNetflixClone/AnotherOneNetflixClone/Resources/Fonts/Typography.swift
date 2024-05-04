//
//  Typography.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 04.05.2024.
//

import SwiftUI

enum PoppinsFont: String {
    case regular400 = "Poppins-Regular"
    case medium500 = "Poppins-Medium"
    case semiBold600 = "Poppins-SemiBold"
    case bold700 = "Poppins-Bold"
}

enum Typography {
    case largeTitle
    case title
    case title2
    case title3
    case headline
    case subheadline
    case body
    case callout
    case footnote
    case caption
    case caption2
    
    var font: Font {
        switch self {
        
        case .largeTitle:
            return .poppins(.regular400, size: 34)
        case .title:
            return .poppins(.regular400, size: 28)
        case .title2:
            return .poppins(.regular400, size: 22)
        case .title3:
            return .poppins(.regular400, size: 20)
        case .headline:
            return .poppins(.semiBold600, size: 17)
        case .subheadline:
            return .poppins(.regular400, size: 15)
        case .body:
            return .poppins(.regular400, size: 17)
        case .callout:
            return .poppins(.regular400, size: 16)
        case .footnote:
            return .poppins(.regular400, size: 13)
        case .caption:
            return .poppins(.regular400, size: 12)
        case .caption2:
            return .poppins(.regular400, size: 11)
        }
    }
}

extension Font {
    static func poppins(_ type: PoppinsFont, size: CGFloat) -> Font {
        return Font.custom(type.rawValue, size: size * DeviceType.multiplier)
    }
}

extension View {
    func typography(_ style: Typography) -> some View {
        return self.font(style.font)
    }
}
