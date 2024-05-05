//
//  ShareButton.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 03.05.2024.
//

import SwiftUI

struct ShareButton: View {
    
    //MARK: - Properties
    
    var urlString: String = "https://www.google.com.ua"
    
    //MARK: - Body
    
    @ViewBuilder
    var body: some View {
        if let url = URL(string: urlString) {
            ShareLink(item: url) {
                VStack(spacing: Space.xs) {
                    Image(systemName: .shareIconString)
                        .typography(.title)
                    
                    Text("Share")
                        .typography(.caption)
                        .foregroundStyle(.appLightGray)
                }
                .foregroundStyle(.appWhite)
                .padding(Space.xs)
                .background(.appTransparent)
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ShareButton()
    }
}
