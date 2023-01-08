//
//  ChevronDownButton.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/5/23.
//

import SwiftUI

struct ChevronDownButton: View {
    
    let iconName : String
    let height : CGFloat
    let width : CGFloat
    
    var body: some View {
        
        Image(systemName: iconName)
            .frame(width: width, height: height)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .background(
            Rectangle()
                .foregroundColor(Color.theme
                    .background)
            )
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 10, x: 0, y: 0
            )
            .padding()
    }
}

struct ChevronDownButton_Previews: PreviewProvider {
    static var previews: some View {
        ChevronDownButton(iconName: "chevron.down", height: 15, width: 15)
    }
}
