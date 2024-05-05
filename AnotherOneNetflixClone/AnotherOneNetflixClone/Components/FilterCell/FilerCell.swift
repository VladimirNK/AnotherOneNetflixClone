//
//  FilerCell.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 01.05.2024.
//

import SwiftUI

struct FilerCell: View {
    
    //MARK: - Properties
    
    var title: String
    var isDropdown: Bool
    var isSelected: Bool
    
    //MARK: - Body
    
    var body: some View {
        HStack(spacing: Space.xs2) {
            Text(title)
            
            if isDropdown {
                Image(systemName: .chevronDownIconString)
            }
        }
        .padding(.horizontal, Space.m)
        .padding(.vertical, Space.xs)
        .background(
            ZStack {
                Capsule(style: .circular)
                    .fill(.appDarkGray)
                    .opacity(isSelected ? 1 : 0)
                
                Capsule(style: .circular)
                    .stroke(lineWidth: Constants.FilerCell.buttonBorderWidth)
            }
        )
        .foregroundStyle(.appLightGray)
    }
}

//MARK: - Preview

#Preview {
    ZStack {
        Color.appBlack.ignoresSafeArea()
        
        VStack {
            FilerCell(title: "Categories", isDropdown: true, isSelected: false)
            FilerCell(title: "Categories", isDropdown: true, isSelected: true)
            FilerCell(title: "Categories", isDropdown: false, isSelected: false)
        }
        
        
    }
}
