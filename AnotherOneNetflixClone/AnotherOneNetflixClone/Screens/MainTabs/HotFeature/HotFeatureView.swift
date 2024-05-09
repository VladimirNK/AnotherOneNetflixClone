//
//  HotFeature.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 05.05.2024.
//

import SwiftUI
import ComposableArchitecture

struct HotFeatureView: View {
    
    let store: StoreOf<HotFeatureStore>
    
    var body: some View {
        WithPerceptionTracking {
            ZStack {
                Color.red.ignoresSafeArea()
                Text("Hot Feature")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    HotFeatureView(store: Store(initialState: HotFeatureStore.State(), reducer: {
        HotFeatureStore()
    }))
}
