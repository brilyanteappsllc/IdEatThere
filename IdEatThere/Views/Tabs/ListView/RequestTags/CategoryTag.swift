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
                Text(category.rawValue)
            }
        }
        .padding(5)
        .background(selectedCategory == category ? Color.theme.accent : .white)
        .cornerRadius(20)
        .shadow(radius: 4)
        .foregroundColor(.black)
    }
}
