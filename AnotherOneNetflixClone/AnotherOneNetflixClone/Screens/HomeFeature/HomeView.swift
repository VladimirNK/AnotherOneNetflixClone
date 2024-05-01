//
//  HomeView.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 01.05.2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var filters: [FilterModel] = FilterModel.mock
    @State private var selectedFilter: FilterModel? 
    
    var body: some View {
        ZStack {
            Color.appBlack.ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding(.horizontal, 16)
                
                FilterBarView(
                    filters: filters,
                    selectedFilter: selectedFilter) { newFiler in
                        selectedFilter = newFiler
                    } onXMarkPressed: {
                        selectedFilter = nil
                    }
                    .padding(.top, 16)
                
                Spacer() 
            }
        }
        .foregroundStyle(.appWhite )
    }
}

//MARK: - Subviews

extension HomeView {
    
    private var header: some View {
        HStack(spacing: 0) {
            Text("For You")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
            
            HStack(spacing: 16) {
                Image(systemName: "tv.badge.wifi")
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        
                    }
            }
            .font(.title2 )
        }
    }
}

#Preview {
    HomeView()
}
