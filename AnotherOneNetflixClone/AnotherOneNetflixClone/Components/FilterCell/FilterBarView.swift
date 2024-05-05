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
    
    //MARK: - Properties
    
    var filters: [FilterModel]
    var selectedFilter: FilterModel?
    var onFilterPressed: ((FilterModel) -> Void)?
    var onXMarkPressed: (() -> Void)?
    
    //MARK: - Body
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                closeButton
                categoryButtonsGroup
            }
            .padding(.vertical, Space.xs2)
        }
        .animation(.bouncy, value: selectedFilter)
    }
}

//MARK: - Subviews

extension FilterBarView {
    
    @ViewBuilder
    private var closeButton: some View {
        if selectedFilter != nil {
            Image(systemName: .xmakIconString)
                .padding(Space.xs)
                .background(
                    Circle()
                        .stroke(lineWidth: Constants.FilterBarView.buttonBorderWidth)
                )
                .foregroundStyle(.appLightGray)
                .background(.appTransparent)
                .onTapGesture {
                    onXMarkPressed?()
                }
                .transition(AnyTransition.move(edge: .leading))
                .padding(.leading, Space.m)
        }
    }
    
    private var categoryButtonsGroup: some View {
        ForEach(filters, id: \.self) { filter in
            if selectedFilter == nil || selectedFilter == filter {
                FilerCell(
                    title: filter.title,
                    isDropdown: filter.isDropdown,
                    isSelected: selectedFilter == filter
                )
                .background(.appTransparent)
                .onTapGesture {
                    onFilterPressed?(filter)
                }
                .padding(
                    .leading,
                    ((selectedFilter == nil) && filter == filters.first) ? Space.m : 0
                )
            }
        }
    }
}

//MARK: - Preview

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
        FilterBarViewPreview()
    }
    
}
