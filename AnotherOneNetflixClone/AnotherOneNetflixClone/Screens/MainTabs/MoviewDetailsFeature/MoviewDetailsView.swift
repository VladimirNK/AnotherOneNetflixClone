//
//  MoviewDetailsView.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 02.05.2024.
//

import SwiftUI

struct MoviewDetailsView: View {
    
    var product: Product = .mock
    @State private var progress: Double = 0.2
    @State private var isMyList: Bool = false
    @State private var products: [Product] = [] 
    
    var body: some View {
        ZStack {
            Color.appBlack.ignoresSafeArea()
            Color.appDarkGray.opacity(0.3).ignoresSafeArea()
            
            VStack(spacing: .zero) {
                DetailsHeaderView(
                    imageName: product.firstImage,
                    progress: progress ,
                    onAirPlayPressed: {
                        
                    },
                    onXMarkPressed: {
                        
                    }
                )
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading,  spacing: 16) {
                        DetailsProductView(
                            title: product.title,
                            isNew: true,
                            yearReleased: "2024",
                            seasonsCount: 4 ,
                            hasClosedCaptions: true,
                            isTopTen: 7,
                            descriptionText: product.description,
                            castText: "Cast: Tom Cruise, Bart Simpson, Kurt Cobain",
                            onPlayPressed: {
                                
                            },
                            onDownloadPressed: {
                                
                            }
                        )
                        
                        // buutons
                        
                        HStack(spacing: 32) {
                            MyListButton(isMyList: isMyList) {
                                isMyList.toggle()
                            }
                            
                            RateButton { selection in
                                // do some code
                            }
                            
                            ShareButton()
                        }
                        .padding(.leading, 32)
                        
                        VStack(alignment: .leading) {
                            Text("More Like This")
                                .font(.headline )
                            
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible( ), spacing: 8), count: 3 ),
                                      alignment: .center,
                                      spacing: 8 ,
                                      pinnedViews: [],
                                      content: {
                                ForEach(products) { product in
                                    MovieCell(
                                        imageName: product.firstImage,
                                        title: product.title,
                                        isRecentryAdded: product.recentlyAdded
                                    )
                                }
                            })
                        }
                        .foregroundStyle(.appWhite)
                        
                         
                    }
                    .padding(8)
                }
            }
        }
        .task {
            await  getData()
        }
        .navigationBarHidden(true)
    }
    
    func getData() async {
        guard products.isEmpty else { return }
        do {
            products = try await DatabaseHelper().getProducts()
        } catch {
            
        }
    }
}

#Preview {
    MoviewDetailsView()
}
