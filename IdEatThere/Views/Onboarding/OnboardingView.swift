//
//  OnboardingView.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

enum OnboardingStep : Int {
    
    case welcome = 0
    case email = 1
    case phoneNumber = 2
    case phoneVerification = 3
    case profile = 4
}

struct OnboardingView: View {

    @EnvironmentObject var userManager : UserManagerModel

    
    var noSwiping = true
    
    @State var tabSelection : OnboardingStep = .welcome
    @State var buttonDisabled = false
    
    
    var body: some View {
        
        VStack {
            
            // Tab View
            TabView(selection: $tabSelection) {
                
                // Welcome View
                WelcomeView()
                    .tag(OnboardingStep.welcome)
                    .contentShape(Rectangle()).gesture(DragGesture())
                
                // Email View
                EmailView()
                    .tag(OnboardingStep.email)
                    .contentShape(Rectangle()).gesture(DragGesture())
                
                // Phone Number
                PhoneNumberView()
                    .tag(OnboardingStep.phoneNumber)
                    .contentShape(Rectangle()).gesture(DragGesture())
                
                // Phone Number Verification
                PhoneVerficationView()
                    .tag(OnboardingStep.phoneVerification)
                    .contentShape(Rectangle()).gesture(DragGesture())
                
                // Profile View
                CreateProfileView()
                    .tag(OnboardingStep.profile)
                    .contentShape(Rectangle()).gesture(DragGesture())
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            // Button
            Button {
                
                // Detect which tab it is
                
                switch tabSelection {
                    
                case .welcome :
                    
                    tabSelection = .phoneNumber
                    
//                    // TODO: Set up Email and 2FA
                case .email :

                    buttonDisabled.toggle()

                    userManager.createAccount(email: userManager.email, password: userManager.password) { error in

                        if error == nil {

                            tabSelection = .phoneNumber
                        }

                        else {
                            print(error as Any)
                        }

                        if buttonDisabled {
                            buttonDisabled.toggle()
                        }

                    }
                case .phoneNumber :
                   
                    buttonDisabled.toggle()

                    userManager.sendPhoneNumber(phone: userManager.phone) { error in

                        // Check for errors
                        if error == nil {
                            tabSelection = .phoneVerification

                        }

                        else {

                            // Show error
                            print(error as Any)
                        }

                        if buttonDisabled {
                            buttonDisabled.toggle()
                        }

                    }
                    
                    
                case .phoneVerification :
                    
                   buttonDisabled.toggle()
                    
                    userManager.verifyCode(code: userManager.verificationCode) { error in
                        
                        if error == nil {
                
                                    tabSelection = .profile
                        }
                        
                        else {
                            
                            // Show error
                        }
                        if buttonDisabled {
                            
                            buttonDisabled.toggle()
                        }
                        
                    }
                    
                    tabSelection = .profile
                    
                case .profile :
                    
                   buttonDisabled.toggle()
                    
                    userManager.setUserProfile(firstName: userManager.firstName, lastName: userManager.lastName, photo: userManager.photo) { isSuccess in
                        
                        if isSuccess {
                            
                        }
                        
                        else {
                            
                            // Show warning error
                            print(isSuccess)
                            
                        }
                        
                        if buttonDisabled {
                            buttonDisabled.toggle()
                        }
                        
                    }
            
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
                        
                    case .email:
                        Text(buttonDisabled ? "Saving..." : "Create Account")
                        
                    case .phoneNumber:
                        Text("Next")
                        
                    case .phoneVerification :
                        Text("Verify")
                        
                        
                    case .profile :
                        Text(buttonDisabled ? "Uploading..." : "Save Profile")
                        
                        
                    }
                }
            }
            .padding()
            .accentColor(Color.theme.background)
            .disabled(buttonDisabled)
            
        }
        .background(Color.theme.red)
        .disabled(buttonDisabled)
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .environmentObject(UserManagerModel())

    }
}
