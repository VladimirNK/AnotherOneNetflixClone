//
//  Constants.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 04.05.2024.
//

import SwiftUI

public struct Constants {
    
    static let randomImage = "https://picsum.photos/600/600"
    
    public struct DetailsHeaderView {
        public static let aspectRatio: CGFloat = 2.0
    }
    
    public struct MovieCell {
        public static let topRankFont: Font = Font.system(size: 100, weight: .medium, design: .serif)
        public static let fontOffset: CGFloat = 20
    }
    
    public struct HeroCell {
        public static let titleFont: Font = Font.system(size: 50, weight: .medium, design: .serif)
        public static let aspectRatio: CGFloat = 0.8
    }
    
    public struct FilerCell {
        public static let buttonBorderWidth: CGFloat = 1
    }
    
    public struct FilterBarView {
        public static let buttonBorderWidth: CGFloat = 1
    }
}
