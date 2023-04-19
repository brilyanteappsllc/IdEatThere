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
            
            VStack(alignment: .center, spacing: 4) {
                Text(buttonText)
                    .font(.bodyHeaderFont)
                
                
                ZStack{
                    
                    DashedDivider()
                    if isActive {
                        
                        Rectangle()
                            .foregroundColor(Color.theme.accent)
                            .frame(width: 50, height: 2)
                    }
                }
                
            }

    }
}

struct TabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButton(buttonText: "Groups", imageName: "person.3", isActive: true)
    }
}
