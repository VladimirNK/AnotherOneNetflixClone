//
//  AppFeatureView.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 05.05.2024.
//

import SwiftUI
import UIKit
import ComposableArchitecture

struct AppFeatureView: View {
    
    @Perception.Bindable var store: StoreOf<AppFeatureStore>
    
    var body: some View {
        WithPerceptionTracking {
            ZStack(alignment: .bottom) {
                if let homeStore = store.scope(state: \.homeState, action: \.homeActions) {
                    HomeFeatureView(store: homeStore)
                }
                if let hotStore = store.scope(state: \.hotState, action: \.hotActions) {
                    HotFeatureView(store: hotStore)
                }
                if let profileStore = store.scope(state: \.profileState, action: \.profileActions) {
                    ProfileFeatureView(store: profileStore)
                }
                
                AppTabBarView(currentTab: $store.selectedTab.sending(\.changeTab))
            }
        }
    }
}


#Preview {
    AppFeatureView(store: Store(initialState: AppFeatureStore.State(selectedTab: .home), reducer: {
        AppFeatureStore()
    }))
}

