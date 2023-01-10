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

            Image("onboardingRestaurant")
                .resizable()
                .scaledToFit()
            Text("Welcome to I'd Eat There")
                .bold()
                .font(.title)
            Text("A fun new social dining experience!")


        }
        .multilineTextAlignment(.center)
        .foregroundColor(.white)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
