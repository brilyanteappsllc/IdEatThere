//
//  ProfileSettingsButton.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 5/8/23.
//

import SwiftUI

struct ProfileSettingsButton: View {
    
    var image: String
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(Color.theme.background)
                .frame(height: 30)
                .frame(width: 30)
                .cornerRadius(5)
                .shadow(radius: 1)
            
            Image(systemName: image)
                .foregroundColor(Color.theme.accent)
                .font(.splashScreenButtonFont)
            
//            Text(image)
//                .foregroundColor(Color.theme.accent)
//                .font(.splashScreenButtonFont)
            
        }
    }
}

struct ProfileSettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsButton(image: "gear")
    }
}
