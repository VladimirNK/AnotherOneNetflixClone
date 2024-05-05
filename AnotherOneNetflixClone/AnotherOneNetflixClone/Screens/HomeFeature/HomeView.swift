//
//  HomeView.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 01.05.2024.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - Properties
    
    @State private var filters: [FilterModel] = FilterModel.mock
    @State private var selectedFilter: FilterModel?
    @State private var fullHeaderSize: CGSize = .zero
    @State private var heroProduct: Product?
    @State private var scrollViewOffset: CGFloat = .zero
    
    @State private var currentUser: User?
    @State private var productRows: [ProductRow] = []
   
    //MARK: - Body
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.appBlack.ignoresSafeArea()
            gradientLayer
            scrollViewLayer
            fullHeaderWithFilters
        }
        .foregroundStyle(.appWhite)
        .task {
            await getData()
        }
        .navigationBarHidden(true)
    }
    
    func getData() async {
        guard productRows.isEmpty else { return }
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            let products = try await DatabaseHelper().getProducts()
            heroProduct = products.first
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map { $0.brand })
            for brand in allBrands {
                rows.append(ProductRow(title: brand.capitalized, products: products.shuffled()))
            }
            productRows = rows
            
        } catch {
            
        }
    }
}

//MARK: - Subviews

extension HomeView {
        
    private func heroCell(product: Product) -> some View {
        HeroCell(
            imageName: product.firstImage,
            isNetflixFilm: true,
            title: product.title,
            categories: [product.category.capitalized, product.brand],
            onBackgroundPressed: {
                
            },
            onPlayPressed: {
                
            },
            onMyListPressed: {
                
            }
        )
        .padding(Space.xl)
    }
    
    private var categoryRows: some View {
        LazyVStack(spacing: Space.m) {
            ForEach(Array(productRows.enumerated()), id: \.offset) { (rowIndex, row) in
                VStack(alignment: .leading, spacing: Space.xs) {
                    Text(row.title)
                        .font(.headline)
                        .padding(.horizontal, Space.m)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(Array(row.products.enumerated()), id: \.offset) { (index, product) in
                                MovieCell(
                                    imageName: product.firstImage,
                                    title: product.title,
                                    isRecentryAdded: product.recentlyAdded ,
                                    topTenRanking: rowIndex == 1 ? (index + 1) : nil
                                )
                            }
                        }
                        .padding(.horizontal, Space.m)
                    }
                }
            }
        }
    }
    
    private var fullHeaderWithFilters: some View {
        VStack(spacing: .zero) {
            header
            filterBar
        }
        .padding(.bottom, Space.xs)
        .background(blurHeaderBackground)
        .animation(.smooth, value: scrollViewOffset)
        .readingFrame { frame in
            if fullHeaderSize == .zero {
                fullHeaderSize = frame.size
            }
        }
    }
    
    private var header: some View {
        AppHeader(title: "For Volodymyr") { buttonAction in
            switch buttonAction {
            case .shareToDevice:
                print("Tap on shareToDevice")
            case .search:
                print("Tap on search")
            case .showMenu:
                print("Tap on show menu")
            }
        }
        .padding(.horizontal, Space.m)
    }
    
    @ViewBuilder
    private var filterBar: some View {
        if scrollViewOffset > -20 {
            FilterBarView(
                filters: filters,
                selectedFilter: selectedFilter) { newFiler in
                    selectedFilter = newFiler
                } onXMarkPressed: {
                    selectedFilter = nil
                }
                .padding(.top, Space.m)
                .transition(.move(edge: .top).combined(with: .opacity))
        }
    }
    
    private var blurHeaderBackground: some View {
        ZStack {
            if scrollViewOffset < -70 {
                Rectangle()
                    .fill(Color.clear)
                    .background(.ultraThinMaterial)
                    .brightness(-0.2)
                    .ignoresSafeArea()
            }
        }
    }
    
    private var scrollViewLayer: some View {
        ScrollViewWithOnScrollChanged(
            .vertical,
            showsIndicators: false,
            content: {
                VStack(spacing: 8) {
                    Rectangle()
                        .opacity(0)
                        .frame(height: fullHeaderSize.height)
                    
                    if let heroProduct {
                        heroCell(product: heroProduct)
                    }
                    
                    categoryRows
                }
            },
            onScrollChanged: { offset in
                scrollViewOffset = min(0, offset.y)
            }
        )
    }
    
    private var gradientLayer: some View {
        ZStack {
            LinearGradient(
                colors:
                    [.appDarkGray.opacity(1), .appDarkGray.opacity(0)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            LinearGradient(
                colors:
                    [.appDarkRed.opacity(0.5), .appDarkRed .opacity(0)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
        }
        .frame(maxHeight: max(10, (400 + (scrollViewOffset * 0.75))))
        .opacity(scrollViewOffset < -250 ? 0 : 1)
        .animation(.easeOut, value: scrollViewOffset)
    }
    
    
}

#Preview {
    HomeView()
}
