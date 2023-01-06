//
//  CircleButton.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/5/23.
//

import SwiftUI

struct CircleButton: View {
    
    let iconName : String
    let height : CGFloat
    let width : CGFloat
    @Binding var addToMyGroup : Bool
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(addToMyGroup ? Color.theme.gold : Color.theme.accent)
            .frame(width: width, height: height)
            .background(
            Circle()
                .foregroundColor(Color.theme.background)
            )
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 10, x: 0, y: 0
            )
            .padding()
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
            
        CircleButton(iconName: "heart.fill", height: 15, width: 15, addToMyGroup: .constant(false))
                .padding()
                .previewLayout(.sizeThatFits)
                .colorScheme(.dark)
            
            
    }
}
