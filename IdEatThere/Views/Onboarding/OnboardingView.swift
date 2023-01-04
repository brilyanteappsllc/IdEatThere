//
//  OnboardingView.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var model: ContentModel
    @EnvironmentObject var userManager : UserManager
    
    @State var tabSelection = 0
    
    private let blue = Color(red: 0/255, green: 130/255, blue: 167/255)
    private let turquoise = Color(red: 55/255, green: 197/255, blue: 192/255)
    
    var body: some View {
        
        
        VStack {
            
            // Tab View
            TabView(selection: $tabSelection) {
                
                // First Tab
                VStack (spacing: 20) {
                    Image("city2")
                        .resizable()
                        .scaledToFit()
                    Text("Welcome to I'd Eat There!")
                        .bold()
                        .font(.title)
                    Text("The app that makes coordinating where to eat a breeze")
                        
                }
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .tag(0)

                
                // Second Tab
                VStack (spacing: 20) {
                    if userManager.newUser {
                        Text("First, let's create your account")
                            .bold()
                            .font(.title)
                        Text("We'll show you the best restaurants based on your location!")
                    }
                    else {
                        Text("Whoopie! Let's get rollin with some eats")
                    }
                    
                }
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .tag(1)
                
                
                
                // Third Tab
                VStack (spacing: 20) {
                    Image("city1")
                        .resizable()
                        .scaledToFit()
                    Text("Ready to discover some food?")
                        .bold()
                        .font(.title)
                    Text("We'll show you the best restaurants based on your location!")
                    
                }
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .tag(2)
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            
            
            // Button
            Button {
                
                // Detect which tab it is
                if tabSelection == 0  {
                    tabSelection = 1
                }
                else if tabSelection == 1 {
                   userManager.createUserFormShowing = true
                    if !userManager.newUser {
                        tabSelection = 2
                    }
                }
                else {
                    // Request for geo location permission
                    model.requestGeolocationPermission()
                }
                
                
            } label: {
                
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    
                    switch tabSelection {
                        
                    case 0:
                        Text("Next")
                            .bold()
                            .padding()
                        
                    case 1:
                        if userManager.newUser {
                            Text("Create Account")
                                .bold()
                                .padding()
                                .sheet(isPresented: $userManager.createUserFormShowing, onDismiss: userManager.checkLogin) {
                                    CreateUserForm()
                                }
                        }
                        else {
                            Text("Next")
                                .bold()
                                .padding()
                        }
                        
                    case 2:
                        Text("Get My Location")
                            .bold()
                            .padding()
                        
                    default:
                        Text("Error")
                    }
                    
                }
            }
            .padding()
            .accentColor(tabSelection == 0 ? blue: turquoise)
            
        }
        .background(tabSelection == 0 ? blue : turquoise)
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
