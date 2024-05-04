//
//  DetailsHeaderView.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 02.05.2024.
//

import SwiftUI

struct DetailsHeaderView: View {
    
    var imageName: String = Constants.randomImage
    var progress: Double = 0.2
    var onAirPlayPressed: (() -> Void)?
    var onXMarkPressed: (() -> Void)?
    
    var body: some View {
        ZStack(alignment: .bottom ) {
            ImageLoaderView(urlString: imageName)
            
            CustomProgressBar(
                selection: progress,
                range: 0...1,
                background: AnyShapeStyle(.appLightGray),
                foreground: AnyShapeStyle(.appRed),
                cornerRadius: 2,
                height: 4
            )
            .padding(.bottom, 4)
            .animation(.linear, value: progress)
            
            HStack(spacing: 8) {
                Circle()
                    .fill(.appDarkGray)
                    .overlay(
                        Image(systemName: "tv.badge.wifi")
                            .offset(y: 1)
                    )
                    .frame(width: 36, height: 36)
                    .onTapGesture {
                        onAirPlayPressed?()
                    }
                
                Circle()
                    .fill(.appDarkGray)
                    .overlay(
                        Image(systemName: "xmark")
                    )
                    .frame(width: 36, height: 36)
                    .onTapGesture {
                        onXMarkPressed?()
                    }
            }
            .foregroundStyle(.appWhite)
            .font(.subheadline)
            .padding(8)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            
        }
        .aspectRatio(2, contentMode: .fit)
    }
}

#Preview {
    DetailsHeaderView()
}
