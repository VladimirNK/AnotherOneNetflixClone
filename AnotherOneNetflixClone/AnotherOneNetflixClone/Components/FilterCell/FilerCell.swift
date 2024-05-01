//
//  FilerCell.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 01.05.2024.
//

import SwiftUI

struct FilerCell: View {
    
    var title: String = "Categories"
    var isDropdown: Bool = true
    var isSelected: Bool = false
    
    var body: some View {
        HStack(spacing: 4) {
            Text(title)
            
            if isDropdown {
                Image(systemName: "chevron.down")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(
            ZStack {
                Capsule(style: .circular)
                    .fill(.appDarkGray)
                    .opacity(isSelected ? 1 : 0 )
                
                Capsule(style: .circular)
                    .stroke(lineWidth: 1)
            }
        )
        .foregroundStyle(.appLightGray)
        
    }
}

#Preview {
    ZStack {
        Color.appBlack.ignoresSafeArea()
        
        VStack {
            FilerCell( )
            FilerCell(isSelected: true)
            FilerCell(isDropdown: false)
        }
        
        
    }
}
