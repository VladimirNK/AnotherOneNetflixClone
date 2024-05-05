//
//  AppColors.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 01.05.2024.
//

import SwiftUI

// MARK: - App Colors

extension ShapeStyle where Self == Color {
    public static var appBlack: Color { Color(hex: 0x000000) }
    public static var appWhite: Color { Color(hex: 0xFFFFFF) }
    public static var appDarkGray: Color { Color(hex: 0x3E3737) }
    public static var appLightGray: Color { Color(hex: 0xB3B3B3 ) }
    public static var appDarkRed: Color { Color(hex: 0x831010) }
    public static var appRed: Color { Color(hex: 0xDB0000 ) }
    public static var appTransparent: Color { Color.black.opacity(0.001) }
}

// MARK: - App Gradients

extension LinearGradient {
    public static var heroCellGradient: LinearGradient {
        LinearGradient(
            colors: [
                .appBlack.opacity(0),
                .appBlack.opacity(0.4),
                .appBlack.opacity(0.4),
                .appBlack.opacity(0.4)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }
}
