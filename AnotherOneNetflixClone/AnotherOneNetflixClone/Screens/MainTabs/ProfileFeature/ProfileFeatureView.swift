//
//  ProfileFeatureView.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 05.05.2024.
//

import SwiftUI
import ComposableArchitecture

struct ProfileFeatureView: View {
    
    let store: StoreOf<ProfileFeatureStore>
    
    var body: some View {
        WithPerceptionTracking {
            ZStack {
                Color.green.ignoresSafeArea()
                Text("Profile Feature")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    ProfileFeatureView(store: Store(initialState: ProfileFeatureStore.State(), reducer: {
        ProfileFeatureStore()
    }))
}
