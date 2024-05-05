//
//  MovieCell.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 01.05.2024.
//

import SwiftUI

struct MovieCell: View {
    
    //MARK: - Properties
    
    var width: CGFloat = 90
    var height: CGFloat = 140
    var imageName: String = Constants.randomImage
    var title: String?
    var isRecentryAdded: Bool?
    var topTenRanking: Int?
    
    //MARK: - Body
    
    var body: some View {
        HStack(alignment: .bottom, spacing: -Space.xs) {
            rankNumber
            
            ZStack(alignment: .bottom) {
                ImageLoaderView(urlString: imageName)
                
                VStack(spacing: .zero) {
                    movieTitle
                    recentlyAdded
                }
                .padding(.top, Space.xs)
                .background(LinearGradient.heroCellGradient)
            }
            .cornerRadius(CornerRadius.xs)
            .frame(width: width, height: height)
        
        }
        .foregroundStyle(.appWhite)
    }
}

//MARK: - Subviews

extension MovieCell {
    
    @ViewBuilder
    private var rankNumber: some View {
        if let topTenRanking {
            Text("\(topTenRanking)")
                .font(Constants.MovieCell.topRankFont)
                .offset(y: Constants.MovieCell.fontOffset)
        }
    }
    
    @ViewBuilder
    private var movieTitle: some View {
        if let title, let firstWord = title.components(separatedBy: " ").first {
            Text(firstWord)
                .typography(.subheadline)
                .lineLimit(1)
        }
    }
    
    @ViewBuilder
    private var recentlyAdded: some View {
        if let isRecentryAdded {
            Text("Recently Added")
                .typography(.caption)
                .padding(.horizontal, Space.xs2)
                .padding(.vertical, Space.xs3)
                .padding(.bottom, Space.xs3)
                .frame(maxWidth: .infinity)
                .background(.appRed)
                .cornerRadius(CornerRadius.xs)
                .offset(y: Space.xs3)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
                .padding(.horizontal, Space.xs)
                .opacity(isRecentryAdded ? 1 : 0 )
        }
        
    }
}

//MARK: - Preview

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack(alignment: .trailing, spacing: Space.m) {
            MovieCell(title: "Movie Title", isRecentryAdded: true)
            MovieCell(title: "Movie Title")
            MovieCell(title: "Movie Title", isRecentryAdded: true, topTenRanking: 2)
        }
    }
}
