//
//  SplashScreenButton.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 2/23/23.
//

import SwiftUI

struct SplashScreenButton: View {
    
    var buttonName : String
    var login : Bool
    
    var body: some View {
            
        ZStack {
            Rectangle()
                .foregroundColor(login ? .white : Color.theme.red)
                .frame(height: 48)
                .cornerRadius(25)
                .padding(.horizontal)
                .padding(.horizontal)
                .padding(.horizontal)
                .shadow(radius: 2)
            
            Text(buttonName)
                .foregroundColor(login ? Color.theme.red : Color.theme.background)
                .font(.splashScreenButtonFont)
            
        }
        
    }
}

struct SplashScreenButton_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenButton(buttonName: "Test", login: true)
    }
}
