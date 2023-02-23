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
        

            VStack() {
                ZStack {
                    Rectangle()
                        .frame(width: 125, height: 75)
                        .cornerRadius(10)
                        .foregroundColor(Color.theme.green)
                    Text("PlaceHolder")
                        .foregroundColor(Color.theme.accent)
                }
                Text(groupName)
                
            }
    }
}

//struct GridButton_Previews: PreviewProvider {
//    static var previews: some View {
//        GridButton()
//    }
//}
