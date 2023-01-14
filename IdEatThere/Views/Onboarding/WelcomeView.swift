//
//  WelcomeView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/10/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack (spacing: 20) {
            Spacer()

            Image("onboardingRestaurant")
                .resizable()
                .scaledToFit()
            Text("Welcome to I'd Eat There")
                .bold()
                .font(.title)
            Text("A fun new social dining experience!")
            
            Spacer()
            Text("By tapping 'Get Started' you agree to our Privacy Policy")
                .multilineTextAlignment(.center)
                .padding(.bottom, 15)
        }
        .multilineTextAlignment(.center)
        .foregroundColor(.white)
        .padding(.horizontal)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
