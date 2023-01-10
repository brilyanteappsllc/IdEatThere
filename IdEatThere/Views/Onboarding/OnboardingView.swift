//
//  OnboardingView.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var model: RestaurantsContentModel
    @EnvironmentObject var userManager : UserManagerModel
    @EnvironmentObject var modelLocation : RestaurantDataService
    
    enum OnboardingStep : Int {
        
        case welcome = 0
        case phone
    }
    
    @State var tabSelection = 0
    
    private let blue = Color(red: 0/255, green: 130/255, blue: 167/255)
    private let turquoise = Color(red: 55/255, green: 197/255, blue: 192/255)
    
    var body: some View {
        
        
        VStack {
            
            // Tab View
            TabView(selection: $tabSelection) {
                
                // First Tab
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
                .tag(0)

                
              //   Second Tab
                VStack (spacing: 20) {
                    if userManager.newUser {
                        Text("Let's first create an account")
                            .bold()
                            .font(.title)
                        Text("This should only take a few moments")
                    }
                    else {
                        Text("Perfect! Now let's get our location")
                            .bold()
                            .font(.title)
                        
                        Text("Your location is needed to search for nearby restaurants")
                    }

                }
                .padding(.horizontal)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .tag(1)

                
                
                // Third Tab
//                VStack (spacing: 20) {
//
//                        Image("onboardingRestaurant")
//                            .resizable()
//                            .scaledToFit()
//                        Text("Ready to discover some food?")
//                            .bold()
//                            .font(.title)
//                        Text("Your location is needed to search for nearby restaurants")
//
//                }
//                .padding(.horizontal)
//                .multilineTextAlignment(.center)
//                .foregroundColor(.white)
//                .tag(2)
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .disabled(true)
            
            
            
            // Button
            Button {
                
                // Detect which tab it is
                if tabSelection == 0  {
                    tabSelection = 1
                }
                else {
                   userManager.createUserFormShowing = true
                    
                    // Once user creates an account we check for location permission
                    if !userManager.newUser {
                        modelLocation.requestGeolocationPermission()
                    }
                }
                
                
            } label: {
                
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(Color.theme.accent)
                        .frame(height: 48)
                        .cornerRadius(10)
                    
                    switch tabSelection {
                        
                    case 0:
                        Text("Get Started")
                            .foregroundColor(.white)
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
                            Text("Get My Location")
                                .bold()
                                .padding()
                        }
                        
                    default:
                        Text("Error")
                    }
                    
                }
            }
            .padding()
            .accentColor(tabSelection == 0 ? Color.theme.background : Color.theme.background)
            
        }
        .background(tabSelection == 0 ? Color.theme.red: Color.theme.red)
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .environmentObject(RestaurantsContentModel())
            .environmentObject(UserManagerModel())
            .environmentObject(RestaurantDataService())
    }
}
