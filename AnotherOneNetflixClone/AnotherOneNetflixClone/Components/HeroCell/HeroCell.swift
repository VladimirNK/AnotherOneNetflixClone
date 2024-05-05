//
//  HeroCell.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 01.05.2024.
//

import SwiftUI

struct HeroCell: View {
    
    //MARK: - Properies
    
    var imageName: String
    var isNetflixFilm: Bool
    var title: String
    var categories: [String]
    var onBackgroundPressed: (() -> Void)?
    var onPlayPressed: (() -> Void)?
    var onMyListPressed: (() -> Void)?
    
    //MARK: - Body
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(urlString: imageName)
            
            VStack(spacing: Space.m) {
                VStack(spacing: .zero) {
                    if isNetflixFilm {
                        AppLogo()
                    }
                    
                    Text(title)
                        .font(Constants.HeroCell.titleFont)
                }
                
                movieCategories
                buttonsGroup
            }
            .padding(Space.xl)
            .background(LinearGradient.heroCellGradient)
        }
        .foregroundStyle(.appWhite)
        .cornerRadius(CornerRadius.m)
        .aspectRatio(Constants.HeroCell.aspectRatio, contentMode: .fit)
        .onTapGesture {
            onBackgroundPressed?()
        }
    }
}

//MARK: - Subviews

extension HeroCell {
    
    private var movieCategories: some View {
        HStack(spacing: Space.xs) {
            ForEach(categories, id: \.self) { category in
                Text(category)
                    .font(.callout)
                
                if category != categories.last {
                    Circle()
                        .frame(size: Size.xs2)
                }
            }
        }
    }
    
    private var buttonsGroup: some View {
        HStack(spacing: Space.m) {
            MainButton(
                text: "Play",
                buttonType: .primary,
                iconString: .playIconString,
                onTap: { onPlayPressed?() }
            )
            
            MainButton(
                text: "My List",
                buttonType: .secondary,
                iconString: .plusIconString,
                onTap: { onMyListPressed?() }
            )
        }
    }
}

//MARK: - Preview

#Preview {
    HeroCell(
        imageName: Constants.randomImage,
        isNetflixFilm: true,
        title: "Players",
        categories: ["Raunchy", "Romantic", "Comedy"]
    )
    .padding(Space.xl4)
}
