//
//  OnboardingView.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

enum OnboardingStep : Int {
    
    case welcome = 0
    case phoneNumber = 1
    case phoneVerification = 2
    case profile = 3
    case contacts = 4
    case geoLocationPerm = 5
    
}

struct OnboardingView: View {
    
    @EnvironmentObject var model: RestaurantsContentModel
    @EnvironmentObject var userManager : UserManagerModel
    @EnvironmentObject var modelLocation : RestaurantDataService
    
    @State var tabSelection : OnboardingStep = .welcome
    
    
    var body: some View {
        
        VStack {
            
            // Tab View
            TabView(selection: $tabSelection) {
                
                // Welcome View
                WelcomeView()
                    .tag(OnboardingStep.welcome)
                
                // Phone Number
                PhoneNumberView()
                    .tag(OnboardingStep.phoneNumber)
                
                // Phone Number Verification
                PhoneVerficationView()
                    .tag(OnboardingStep.phoneVerification)
                
                // Profile View
                CreateProfileView()
                    .tag(OnboardingStep.profile)
                
                // Contacts View
                ContactsView()
                    .tag(OnboardingStep.contacts)
                
                
                // GeoLocation Permission
                GeoLocationPermission()
                    .tag(OnboardingStep.geoLocationPerm)
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .disabled(true)
            
            
            
            // Button
            
            Button {
                
                // Detect which tab it is
                
                switch tabSelection {
                    
                case .welcome :
                    
                    tabSelection = .phoneNumber
                    
                case .phoneNumber :
                    
                    tabSelection = .phoneVerification
                    
                case .phoneVerification :
                    
                    tabSelection = .profile
                    
                case .profile :
                    
                    tabSelection = .contacts
                    
                case .contacts :
                    
                    tabSelection = .geoLocationPerm
                    
                case .geoLocationPerm :
                    
                    modelLocation.requestGeolocationPermission()
                }
                
                
                
            } label: {
                
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(Color.theme.accent)
                        .frame(height: 48)
                        .cornerRadius(10)
                    
                    switch tabSelection {
                        
                    case .welcome:
                        Text("Get Started")
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                        
                    case .phoneNumber:
                        Text("Next")
                        
                    case .phoneVerification :
                        Text("Verify")
                        
                        
                    case .profile :
                        Text("Continue")
                        
                    case .contacts :
                        Text("Next")
                        
                        
                    case .geoLocationPerm :
                        
                        Text("Get My Location")
                        
                    }
                    
                }
            }
            .padding()
            .accentColor(Color.theme.background)
            
        }
        .background(Color.theme.red)
        
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
