//
//  CategoryTag.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 4/17/23.
//

import Foundation
import SwiftUI


struct CategoryTag : View {
    
    @Binding var selectedCategory : FoodCategory
    
    let category : FoodCategory
    
    var body: some View {
        
        
        Button {
            selectedCategory = category
        } label: {
            HStack {
                Text(category.emoji)
                    .font(.filtersFont)
                Text(category.displayText)
                    .font(.filtersFont)
            }
        }
        .padding(5)
        .padding(.horizontal, 4)
        .background(selectedCategory == category ? Color.theme.accent : .white)
        .cornerRadius(20)
        .shadow(radius: 2)
        .foregroundColor(.black)
    }
}
