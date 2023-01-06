//
//  FilterTag.swift
//  FilterBarTest
//
//  Created by Brilyante Apps LLC on 1/4/23.
//

import SwiftUI

struct FilterTag: View {
    
    var filterData : FilteredTagData
    
    
    var body: some View {
        
        Label(filterData.title, systemImage: filterData.imageName)
            .font(.caption)
            .foregroundColor(filterData.isSelected ? Color.theme.blackText : .white)
            
            .padding(4)
            .background(
                RoundedRectangle(cornerRadius: 8)  // 3
                    .foregroundColor(filterData.isSelected ? Color.theme.accent : Color.black.opacity(0.6))
            )
            // 4
            .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
    }
    }
