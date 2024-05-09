//
//  AppFeatureStore.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 05.05.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct AppFeatureStore {
    
    @ObservableState
    struct State {
        var selectedTab: AppTabs
        var homeState: HomeFeatureStore.State?
        var hotState: HotFeatureStore.State?
        var profileState: ProfileFeatureStore.State?
    }
    
    enum Action {
        case changeTab(AppTabs)
        case homeActions(HomeFeatureStore.Action)
        case hotActions(HotFeatureStore.Action)
        case profileActions(ProfileFeatureStore.Action)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .changeTab(let tabType):
                state.selectedTab = tabType
                return changeTabHandler(into: &state)
            }
        }
        .ifLet(\.homeState, action: \.homeActions) {
            HomeFeatureStore()
        }
        .ifLet(\.hotState, action: \.hotActions) {
            HotFeatureStore()
        }
        .ifLet(\.profileState, action: \.profileActions) {
            ProfileFeatureStore()
        }
    }
    
    private func changeTabHandler(into state: inout State) -> Effect<Action> {
        state.homeState = nil
        state.hotState = nil
        state.profileState = nil
        
        switch state.selectedTab {
        case .home:
            state.homeState = HomeFeatureStore.State()
        case .new:
            state.hotState = HotFeatureStore.State()
        case .profile:
            state.profileState = ProfileFeatureStore.State()
        }
        return .none
    }
}
