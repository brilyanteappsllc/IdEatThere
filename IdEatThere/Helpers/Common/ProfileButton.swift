//
//  ProfileButton.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 5/6/23.
//

import SwiftUI

struct ProfileButton: View {
    
    var buttonName : String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.theme.background)
                .frame(height: 30)
                .cornerRadius(5)
                .shadow(radius: 1)
            
            Text(buttonName)
                .foregroundColor(Color.theme.accent)
                .font(.splashScreenButtonFont)
            
        }
    }
}

struct ProfileButton_Previews: PreviewProvider {
    static var previews: some View {
        ProfileButton(buttonName: "Test")
    }
}
