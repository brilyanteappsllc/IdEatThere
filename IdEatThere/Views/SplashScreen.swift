//
//  SplashScreen.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 2/23/23.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        
        NavigationView{
            VStack {
                
                Text("Splash Screen")
                
                NavigationLink {
                    LoginForm()
                } label: {
                    SplashScreenButton(buttonName: "Login")
                }
                
                NavigationLink {
                    OnboardingView()
                } label: {
                    SplashScreenButton(buttonName: "Register")
                }

            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
