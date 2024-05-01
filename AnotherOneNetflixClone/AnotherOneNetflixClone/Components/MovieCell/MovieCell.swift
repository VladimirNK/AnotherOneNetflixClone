//
//  MovieCell.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 01.05.2024.
//

import SwiftUI

struct MovieCell: View {
    
    var width: CGFloat = 90
    var height: CGFloat = 140
    var imageName: String = Constants.randomImage
    var title: String? = "Movie Title"
    var isRecentryAdded: Bool = true
    var topTenRanking: Int?
    
    var body: some View {
        HStack(alignment: .bottom, spacing: -8) {
            if let topTenRanking {
                Text("\(topTenRanking)")
                    .font(.system(size: 100, weight: .medium, design: .serif))
                    .offset(y: 20)
            }
            
            
            ZStack(alignment: .bottom) {
                ImageLoaderView(urlString: imageName)
                
                VStack(spacing: .zero) {
                    if let title, let firstWord = title.components(separatedBy: " ").first {
                        Text(firstWord )
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .lineLimit(1)
                         
                    }
                    
                    Text("Recently Added")
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding(.horizontal, 4)
                        .padding(.vertical, 2)
                        .padding(.bottom, 2)
                        .frame(maxWidth: .infinity)
                        .background(.appRed)
                        .cornerRadius(2)
                        .offset(y: 2)
                        .lineLimit(1)
                        .minimumScaleFactor(0.1)
                        .padding(.horizontal, 8)
                        .opacity(isRecentryAdded ? 1 : 0 )
                        
                }
                .padding(.top, 6)
                .background(LinearGradient.heroCellGradient )
            }
            .cornerRadius(4)
            .frame(width: width, height: height)
        
        }
        .foregroundStyle(.appWhite)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack {
            MovieCell(isRecentryAdded: true)
            MovieCell(isRecentryAdded: false)
            MovieCell(isRecentryAdded: true, topTenRanking: 2)
            MovieCell(isRecentryAdded: false, topTenRanking: 10)
        }
    }
}
