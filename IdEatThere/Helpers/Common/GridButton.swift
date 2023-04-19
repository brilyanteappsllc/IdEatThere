//
//  GridButton.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 2/16/23.
//

import SwiftUI

struct GridButton: View {
    
    var group : Groups
    
    var body: some View {
        
        
        
        
        VStack(alignment: .leading, spacing: 5) {
            
            HStack {
                
                Rectangle()
                    .frame(width: 110, height: 110)
                    .cornerRadius(10)
                    .padding(5)
                
                Text(group.groupName ?? "")
                    .font(.bodyHeaderFont)
                    .foregroundColor(Color.theme.secondaryText)
                
            }
            .padding(5)
            .cornerRadius(15)
            .shadow(radius: 0.5)
        }
    }
}

//struct GridButton_Previews: PreviewProvider {
//    static var previews: some View {
//        GridButton()
//    }
//}
