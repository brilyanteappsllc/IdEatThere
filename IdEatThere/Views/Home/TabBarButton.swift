//
//  TabBarButton.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 2/16/23.
//

import SwiftUI

struct TabBarButton: View {
    
    var buttonText : String
    var imageName : String
    var isActive : Bool
    
    var body: some View {
        
        GeometryReader {geo in
            
            
            VStack(alignment: .center, spacing: 4) {
                
                if isActive {
                    
                    Rectangle()
                        .foregroundColor(Color.theme.accent)
                        .frame(width: geo.size.width/2, height: 4)
                }
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 30)
                Text(buttonText)
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
            
        }
    }
}

struct TabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButton(buttonText: "Groups", imageName: "person.3", isActive: true)
    }
}