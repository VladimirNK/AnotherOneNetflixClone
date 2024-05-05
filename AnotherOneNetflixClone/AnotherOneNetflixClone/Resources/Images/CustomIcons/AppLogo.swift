//
//  AppLogo.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 04.05.2024.
//

import SwiftUI

struct AppLogo: View {
    var body: some View {
        HStack(spacing: Space.xs2) {
            Text("N")
                .fontWeight(.black)
                .foregroundStyle(.appRed)
                .typography(.largeTitle)
            
            Text("FILM")
                .kerning(3)
                .typography(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.appWhite)
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        AppLogo()
    }
    
}
