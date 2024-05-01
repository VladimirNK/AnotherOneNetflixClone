//
//  FilterBarView.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 01.05.2024.
//

import SwiftUI

struct FilterModel: Hashable, Equatable  {
    let title: String
    let isDropdown: Bool
    
    static var mock: [FilterModel] {
        [
            FilterModel(title: "TV Shows", isDropdown: false),
            FilterModel(title: "Movies", isDropdown: false),
            FilterModel(title: "Categories", isDropdown: true)
        ]
    }
}

struct FilterBarView: View {
    
    var filters: [FilterModel] = FilterModel.mock
    var selectedFilter: FilterModel?
    var onFilterPressed: ((FilterModel ) -> Void)?
    var onXMarkPressed: (() -> Void)?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                if selectedFilter != nil {
                    Image(systemName: "xmark")
                        .padding(8)
                        .background(
                            Circle()
                                .stroke(lineWidth: 1)
                        )
                        .foregroundStyle(.appLightGray)
                        .background(Color.black.opacity(0.001))
                        .onTapGesture {
                            onXMarkPressed?()
                        }
                        .transition(AnyTransition.move(edge: .leading))
                        .padding(.leading, 16)
                }
                
                
                ForEach(filters, id: \.self) { filter in
                    if selectedFilter == nil || selectedFilter == filter {
                        FilerCell(
                            title: filter.title,
                            isDropdown: filter.isDropdown,
                            isSelected: selectedFilter == filter
                        )
                        .background(Color.black.opacity(0.001))
                        .onTapGesture {
                            onFilterPressed?(filter)
                        }
                        .padding(.leading, ((selectedFilter == nil) && filter == filters.first) ? 16 : 0)
                    }
                    
                }
            }
            .padding(.vertical, 4)
        }
        .animation(.bouncy, value: selectedFilter)
        
    }
}

fileprivate struct FilterBarViewPreview: View {
    
    @State private var filters: [FilterModel] = FilterModel.mock
    @State private var selectedFilter: FilterModel?
    
    var body: some View {
        FilterBarView(
            filters: filters,
            selectedFilter: selectedFilter) { newFiler in
                selectedFilter = newFiler
            } onXMarkPressed: {
                selectedFilter = nil
            }

    }
}

#Preview {
    ZStack {
        Color.appBlack.ignoresSafeArea()
        FilterBarView()
    }
    
}
