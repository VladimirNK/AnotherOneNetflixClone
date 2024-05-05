//
//  CGSize.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 05.05.2024.
//

import Foundation

extension CGSize {
    init(square side: CGFloat) {
        self.init(width: side, height: side)
    }
}
