//
//  AppHeader.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 05.05.2024.
//

import SwiftUI

extension AppHeader {
    
    enum Buttons: CaseIterable {
        case shareToDevice, search, showMenu
        
        var icon: String {
            switch self {
            case .shareToDevice:
                return .tvBadgeWifiIconString
            case .search:
                return .searchIconString
            case .showMenu:
                return .menuIconString
            }
        }
    }
}

struct AppHeader: View {
    
    //MARK: - Properties
    
    var title: String
    var showMenuButton: Bool = false
    var onButtonTap: ((AppHeader.Buttons) -> Void)?
    
    //MARK: - Properties
    
    var body: some View {
        HStack(spacing: Space.xl3) {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .typography(.title)
            
            HStack(spacing: Space.xl) {
                ForEach(Buttons.allCases, id: \.self) { action in
                    if action == .showMenu && !showMenuButton {
                        EmptyView()
                    } else {
                        headerButton(type: action)
                    }
                }
            }
            .typography(.title2)
        }
        .foregroundStyle(.appWhite)
    }
}

//MARK: - Subviews

extension AppHeader {
    
    private func headerButton(type: AppHeader.Buttons) -> some View {
        Button {
            onButtonTap?(type)
        } label: {
            Image(systemName: type.icon)
                .frame(size: Size.xl)
        }
        .buttonStyle(MainButtonStyleViewModifier())
    }
}

//MARK: - Perview

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack {
            AppHeader(title: "For Volodymyr")
            AppHeader(title: "For Volodymyr", showMenuButton: true)
        }
        
    }
}
