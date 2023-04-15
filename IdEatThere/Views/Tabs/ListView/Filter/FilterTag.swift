//
//  FilterTag.swift
//  FilterBarTest
//
//  Created by Brilyante Apps LLC on 1/4/23.
//

import SwiftUI

struct FilterTag: View {
    
//    var filterData : FilteredTagData
    @Binding var selectedCategory : FoodCategory
    let category : FoodCategory
    
    var body: some View {
        
        
        Button {
            selectedCategory = category
        } label: {
            HStack {
                Text(category.emoji)
                    .font(.title)
                Text(category.rawValue)
                    .bold()
            }
        }
        .padding(5)
        .background(selectedCategory == category ? Color.theme.accent : .white)
        .cornerRadius(20)
        .shadow(radius: 4)
        .foregroundColor(.black)

        
        
//        HStack {
//
//            Image(filterData.imageName)
//
//            Text(filterData.title)
//
//
//        }
//
//        .font(.caption)
//        .foregroundColor(filterData.isSelected ? Color.theme.blackText : .white)
//
//        .padding(4)
//        .background(
//            RoundedRectangle(cornerRadius: 8)  // 3
//                .foregroundColor(filterData.isSelected ? Color.theme.accent : Color.black.opacity(0.6))
//        )
        
        //        Label(filterData.title, systemImage: filterData.imageName)
        //            .font(.caption)
        //            .foregroundColor(filterData.isSelected ? Color.theme.blackText : .white)
        //
        //            .padding(4)
        //            .background(
        //                RoundedRectangle(cornerRadius: 8)  // 3
        //                    .foregroundColor(filterData.isSelected ? Color.theme.accent : Color.black.opacity(0.6))
        //            )
        //            // 4
        //            .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
        //    }
    }
}
