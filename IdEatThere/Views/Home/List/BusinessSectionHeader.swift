//
//  BusinessSectionHeader.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

struct BusinessSectionHeader: View {
    
    var title: String
    
    var body: some View {
    
        ZStack (alignment: .leading) {
        
        Rectangle()
            .foregroundColor(.white)
            .cornerRadius(10)
            .frame(height: 50)
        Text(title)
            .font(.headline)
            .foregroundColor(.black)
        
    }
        Divider()
}
}

