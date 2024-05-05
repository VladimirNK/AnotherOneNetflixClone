//
//  DetailsHeaderView.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 02.05.2024.
//

import SwiftUI

struct DetailsHeaderView: View {
    
    //MARK: - Properties
    
    var imageName: String = Constants.randomImage
    var progress: Double = 0.2
    var onAirPlayPressed: (() -> Void)?
    var onXMarkPressed: (() -> Void)?
    
    //MARK: - Body
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(urlString: imageName)
            progressBar
            buttonsGroup
        }
        .aspectRatio(
            Constants.DetailsHeaderView.aspectRatio,
            contentMode: .fit
        )
    }
}

//MARK: - Preview

#Preview {
    DetailsHeaderView()
}

//MARK: - Subviews

extension DetailsHeaderView {
    
    private var buttonsGroup: some View {
        HStack(spacing: Space.xs) {
            DetailsProductViewButton(iconString: .tvBadgeWifiIconString) {
                onAirPlayPressed?()
            }
            
            DetailsProductViewButton(iconString: .xmakIconString) {
                onXMarkPressed?()
            }
        }
        .padding(Space.xs)
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topTrailing
        )
    }
    
    private var progressBar: some View {
        CustomProgressBar(
            selection: progress,
            range: 0...1,
            background: AnyShapeStyle(.appLightGray),
            foreground: AnyShapeStyle(.appRed),
            cornerRadius: CornerRadius.xs,
            height: Space.xs2
        )
        .padding(.bottom, Space.xs2)
        .animation(.linear, value: progress)
    }
}
