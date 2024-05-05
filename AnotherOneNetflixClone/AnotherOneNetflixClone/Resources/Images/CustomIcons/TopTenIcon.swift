//
//  TopTenIcon.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 04.05.2024.
//

import SwiftUI

struct TopTenIcon: View {
    var body: some View {
        Rectangle()
            .fill(.appRed)
            .frame(size: Size.xl2)
            .overlay {
                VStack(spacing: -Space.xs2) {
                    Text("TOP")
                        .font(.poppins(.semiBold600, size: 8))
                    Text("10")
                        .font(.poppins(.semiBold600, size: 16))
                }
                .foregroundStyle(.appWhite)
                .offset(y: Space.xs4)
            }
    }
}

#Preview {
    TopTenIcon()
}
