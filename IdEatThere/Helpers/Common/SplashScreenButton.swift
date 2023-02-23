//
//  SplashScreenButton.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 2/23/23.
//

import SwiftUI

struct SplashScreenButton: View {
    
    var buttonName : String
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(Color.theme.gold)
                .frame(height: 48)
                .cornerRadius(10)
                .padding(.horizontal)
            
            Text(buttonName)
            
        }
        
    }
}

struct SplashScreenButton_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenButton(buttonName: "Test")
    }
}
