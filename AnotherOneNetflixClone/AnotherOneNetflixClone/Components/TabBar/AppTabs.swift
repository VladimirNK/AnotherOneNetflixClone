//
//  AppTabs.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 05.05.2024.
//

import Foundation

enum AppTabs {
    case home, new, profile
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .new:
            return "New & Hot"
        case .profile:
            return "My Netflix"
        }
    }
    
    func getImageName(isSelected: Bool) -> String {
        switch self {
        case .home:
            return isSelected
                ? .tabBarHomeSelectedIconString
                : .tabBarHomeIconString
        case .new:
            return isSelected
                ? .tabBarNewSelectedIconString
                : .tabBarNewIconString
        case .profile:
            return isSelected
                ? .tabBarProfileSelectedIconString
                : .tabBarProfileIconString
        }
    }
}
