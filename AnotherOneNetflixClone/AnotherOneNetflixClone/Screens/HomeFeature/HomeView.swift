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
    @State private var fullHeaderSize: CGSize = .zero
    @State private var heroProduct: Product?
    
    @State private var currentUser: User?
    @State private var productRows: [ProductRow] = []
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.appBlack.ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 8) {
                    Rectangle()
                        .opacity(0)
                        .frame(height: fullHeaderSize.height)
                    
                    if let heroProduct {
                        heroCell(product: heroProduct)
                    }
                    
                    categoryRows
                }
            }
            
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
            }
            .background(Color.blue)
            .readingFrame { frame in
                fullHeaderSize = frame.size
            }
        }
        .foregroundStyle(.appWhite)
        .task {
            await getData()
        }
        .navigationBarHidden(true)
    }
    
    func getData() async {
        guard productRows .isEmpty else { return }
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            let products = try await DatabaseHelper().getProducts()
            heroProduct = products.first
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map { $0.brand })
            for brand in allBrands {
                rows.append(ProductRow(title: brand.capitalized, products: products))
            }
            productRows = rows
            
        } catch {
            
        }
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
     
    private func heroCell(product: Product) -> some View {
        HeroCell(
            imageName: product.firstImage ,
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
        .padding(24)
    }
    
    private var categoryRows: some View {
        LazyVStack(spacing: 16) {
            ForEach(Array(productRows.enumerated()), id: \.offset) { (rowIndex, row) in
                VStack(alignment: .leading, spacing: 6) {
                    Text(row.title)
                        .font(.headline)
                        .padding(.horizontal, 16)
                     
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
                        .padding(.horizontal, 16)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
