//
//  AppTabBarView.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 05.05.2024.
//

import SwiftUI

struct AppTabBarView: View {
    
    @Binding var currentTab: AppTabs
    
    var body: some View {
        
        VStack {
            HStack() {
                tabItem(content: .home, isSelected: currentTab == .home)
                    .onTapGesture {
                        currentTab = .home
                    }
                
                tabItem(content: .new, isSelected: currentTab == .new)
                    .onTapGesture {
                        currentTab = .new
                    }
                
                tabItem(content: .profile, isSelected: currentTab == .profile)
                    .onTapGesture {
                        currentTab = .profile
                    }
            }
            .background(.ultraThinMaterial)
            .brightness(-0.2)
            
        }
    }
}
    
    #Preview {
        ZStack {
            Color.red.ignoresSafeArea()
            
            VStack {
                Spacer()
                AppTabBarView(currentTab: .constant(.home))
            }
        }
        
    }
    
    extension AppTabBarView {
        
        private func tabItem(content: AppTabs, isSelected: Bool) -> some View {
            VStack(spacing: .zero) {
                Image(systemName: content.getImageName(isSelected: isSelected))
                    .typography(.headline)
                    .frame(size: Size.xl)
                
                Text(content.title)
                    .typography(.caption2)
            }
            .foregroundStyle(isSelected ? .appWhite : .appLightGray)
            .frame(height: 48)
            .frame(maxWidth: .infinity)
        }
    }
    
