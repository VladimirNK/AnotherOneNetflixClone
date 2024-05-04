//
//  DetailsProductView.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 03.05.2024.
//

import SwiftUI

struct DetailsProductView: View {
    
    var title: String = "Movie Title"
    var isNew: Bool = true
    var yearReleased: String? = "2024"
    var seasonsCount: Int? = 2
    var hasClosedCaptions: Bool = true
    var isTopTen: Int? = 6
    var descriptionText: String? = "This is the description of the title that is selected and it should go multiple lines."
    var castText: String? = "Cast: Nick, Volodymyr, Kseniya"
    var onPlayPressed: (() -> Void)?
    var onDownloadPressed: (() -> Void)?
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // Title
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // New
            HStack(spacing: 8) {
                if isNew {
                    Text("New")
                        .foregroundStyle(.green)
                }
                
                if let yearReleased {
                    Text(yearReleased)
                }
                
                
                if let seasonsCount {
                    Text("\(seasonsCount) Seasons ")
                }
                
                if hasClosedCaptions {
                    Image(systemName: "captions.bubble")
                }
            }
            .foregroundStyle(.appLightGray)
            
            // Top 10
            if let isTopTen {
                HStack(spacing: 8) {
                    topTenIcon
                    
                    Text("#\(isTopTen) in TV Shows today")
                        .font(.headline )
                }
            }
            
            //Buttons
            VStack(spacing: 8) {
                
                MainButton(
                    text: "Play",
                    buttonType: .primary,
                    iconString: .playIconString,
                    onTap: { onPlayPressed?() }
                )
                
                MainButton(
                    text: "Download",
                    buttonType: .secondary,
                    iconString: .downloadIconString,
                    onTap: { onDownloadPressed?() }
                )
            }
            
            Group {
                //Description
                if let descriptionText {
                    Text(descriptionText)
                }
                
                //Cast
                if let castText {
                    Text(castText)
                        .foregroundStyle(.appLightGray )
                }
            }
            .font(.callout)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
        }
        .foregroundStyle(.appWhite)
    }
    
    private var topTenIcon: some View {
        Rectangle()
            .fill(.appRed)
            .frame(width: 28, height: 28)
            .overlay(
                VStack(spacing: -4 ) {
                    Text("TOP")
                        .fontWeight(.bold )
                        .font(.system(size: 8))
                    Text("10")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                }
                    .offset(y: 1)
            )
    }
    
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        DetailsProductView()
    }
    
}
