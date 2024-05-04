//
//  ShareButton.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 03.05.2024.
//

import SwiftUI

struct ShareButton: View {
    
    var urlString: String = "https://www.google.com.ua"
    
    @ViewBuilder 
    var body: some View {
        if let url = URL(string: urlString) {
            ShareLink(item: url) {
                VStack(spacing: 8) {
                    Image(systemName: .shareIconString)
                        .font(.title)
                    
                    Text("Share ")
                        .font(.caption)
                        .foregroundStyle(.appLightGray)
                }
                .foregroundStyle(.appWhite)
                .padding(8)
                .background(Color.black.opacity(0.001))
                
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
