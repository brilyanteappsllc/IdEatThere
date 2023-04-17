//
//  SortTag.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 4/17/23.
//

import Foundation
import SwiftUI

struct SortTag : View {
    
    @Binding var selectedSort: SortOptions
    
    let sort  : SortOptions
    
    var body: some View {
        
        
        Button {
            selectedSort = sort
        } label: {
            HStack {
                Image(systemName: sort.imageName)
                Text(sort.rawValue)
                    .font(.bodyFont)
            }
        }
        .padding(5)
        .background(selectedSort == sort ? Color.theme.accent : .white)
        .cornerRadius(20)
        .shadow(radius: 4)
        .foregroundColor(.black)
    }
    
}
