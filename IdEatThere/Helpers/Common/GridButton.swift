//
//  GridButton.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 2/16/23.
//

import SwiftUI

struct GridButton: View {
    
    var groupName : String
    
    var body: some View {
        
        GeometryReader {geometry in
            
            VStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .frame(height: geometry.size.width * 0.25)
                        .cornerRadius(10)
                        .foregroundColor(Color.theme.green)
                    Text("PlaceHolder")
                        .foregroundColor(Color.theme.accent)
                }
                Text(groupName)
                
            }
        }
    }
}

//struct GridButton_Previews: PreviewProvider {
//    static var previews: some View {
//        GridButton()
//    }
//}
