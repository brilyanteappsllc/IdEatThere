//
//  FilterTag.swift
//  FilterBarTest
//
//  Created by Brilyante Apps LLC on 1/4/23.
//

import SwiftUI

struct AttributeTag: View {
    
    @Binding var selectedAttribute : AttributeOptions
    
    let attribute  : AttributeOptions
    
    var body: some View {
        
        
        Button {
            selectedAttribute = attribute
        } label: {
            HStack {
                Image(systemName: attribute.imageName)
                Text(attribute.rawValue)
                    .font(.bodyFont)
            }
        }
        .padding(5)
        .background(selectedAttribute == attribute ? Color.theme.accent : .white)
        .cornerRadius(20)
        .shadow(radius: 4)
        .foregroundColor(.black)
    }}
