//
//  HeroCell.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 01.05.2024.
//

import SwiftUI

struct HeroCell: View {
    
    var imageName: String = Constants.randomImage
    var isNetflixFilm: Bool = true
    var title: String = "Players"
    var categories: [String] = ["Raunchy", "Romantic", "Comedy"]
    var onBackgroundPressed: (() -> Void)?
    var onPlayPressed: (() -> Void)?
    var onMyListPressed: (() -> Void)?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(urlString: imageName)
            
            VStack(spacing: 16) {
                VStack(spacing: .zero) {
                    // Netflix logo
                    if isNetflixFilm {
                        HStack(spacing: .zero) {
                            Text("N")
                                .fontWeight(.black)
                                .foregroundStyle(.appRed)
                                .font(.largeTitle)
                            
                            Text("FILM")
                                .kerning(3)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.appWhite)
                            
                        }
                    }
                    
                    
                    // Title
                    Text(title)
                        .font(.system(size: 50, weight: .medium, design: .serif))
                    
                }
                
                // Categories
                HStack(spacing: 8) {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                            .font(.callout)
                        
                        if category != categories.last {
                            Circle()
                                .frame(width: 4, height: 4)
                        }
                        
                    }
                }
                
                //Buttons
                HStack(spacing: 16) {
                    
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
            //.background(Color.blue)
            .padding(24)
            .background(LinearGradient.heroCellGradient)
            
        }
        .foregroundStyle(.appWhite)
        .cornerRadius(10)
        .aspectRatio(0.8, contentMode: .fit)
        .onTapGesture {
            onBackgroundPressed?()
        }
    }
}

#Preview {
    HeroCell()
        .padding(40)
}
