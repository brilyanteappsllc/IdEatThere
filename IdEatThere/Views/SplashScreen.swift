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
                    OnboardingView()
                } label: {
                    SplashScreenButton(buttonName: "Register", login: false)
                }
                
                NavigationLink {
                    LoginForm()
                } label: {
                    SplashScreenButton(buttonName: "Login", login: true)
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
