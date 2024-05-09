//
//  HomeFeatureStore.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 05.05.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct HomeFeatureStore {
    
    @ObservableState
    struct State {
        
    }
    
    enum Action {
        
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
    }
}
