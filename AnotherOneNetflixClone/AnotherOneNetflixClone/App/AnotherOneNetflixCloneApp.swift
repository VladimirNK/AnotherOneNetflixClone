//
//  AnotherOneNetflixCloneApp.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 01.05.2024.
//

import SwiftUI
import ComposableArchitecture

@main
struct AnotherOneNetflixCloneApp: App {
    var body: some Scene {
        WindowGroup {
            AppFeatureView(store: Store(initialState: AppFeatureStore.State(selectedTab: .home), reducer: {
                AppFeatureStore()
            }))
           
        }
    }
}
