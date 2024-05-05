//
//  DetailsProductView.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 03.05.2024.
//

import SwiftUI

struct DetailsProductView: View {
    
    //MARK: - Properties
    
    var title: String
    var isNew: Bool
    var yearReleased: String?
    var seasonsCount: Int?
    var hasClosedCaptions: Bool
    var isTopTen: Int?
    var descriptionText: String?
    var castText: String?
    var onPlayPressed: (() -> Void)?
    var onDownloadPressed: (() -> Void)?
    
    //MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .typography(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            subtitleInfo
            topTenRow
            buttonsGroup
            
            Group {
                movieDescription
                movieCast
            }
            .typography(.callout)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
        }
        .foregroundStyle(.appWhite)
    }
}

//MARK: - Subviews

extension DetailsProductView {
    
    private var subtitleInfo: some View {
        HStack(spacing: Space.xs) {
            if isNew {
                Text("New")
                    .foregroundStyle(.green)
            }
            
            if let yearReleased {
                Text(yearReleased)
            }
            
            if let seasonsCount {
                Text("\(seasonsCount) Seasons")
            }
            
            if hasClosedCaptions {
                Image(systemName: .captionBubbleIconString)
            }
        }
        .foregroundStyle(.appLightGray)
    }
    
    @ViewBuilder
    private var topTenRow: some View {
        if let isTopTen {
            HStack(spacing: Space.xs) {
                TopTenIcon()
                
                Text("#\(isTopTen) in TV Shows today")
                    .typography(.headline)
            }
        }
    }
    
    private var buttonsGroup: some View {
        VStack(spacing: Space.xs) {
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
    }
    
    @ViewBuilder
    private var movieDescription: some View {
        if let descriptionText {
            Text(descriptionText)
        }
    }
    
    @ViewBuilder
    private var movieCast: some View {
        if let castText {
            Text(castText)
                .foregroundStyle(.appLightGray)
        }
    }
}

//MARK: - Preview

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        DetailsProductView(
            title: "Movie Title",
            isNew: true,
            yearReleased: "2024",
            seasonsCount: 4,
            hasClosedCaptions: true,
            isTopTen: 7,
            descriptionText: "This is the description of the title that is selected and it should go multiple lines.",
            castText: "Cast: Tom Cruise, Bart Simpson, Kurt Cobain"
        )
        .padding(.horizontal, Space.m)
    }
}
