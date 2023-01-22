//
//  LoginForm.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

enum LoginStep : Int {
    
    case phoneNumber = 0
    case phoneVerification = 1
    
}

struct LoginForm: View {
    
    @EnvironmentObject var userManager : UserManagerModel
    
    @State var tabSelection : LoginStep = .phoneNumber
    @State var buttonDisabled  = false
    
    
    var body: some View {
        
        VStack {
            
            
            TabView(selection: $tabSelection) {
                
                PhoneNumberView()
                    .tag(LoginStep.phoneNumber)
                    .contentShape(Rectangle()).gesture(DragGesture())
                
                
                PhoneVerficationView()
                    .tag(LoginStep.phoneVerification)
                    .contentShape(Rectangle()).gesture(DragGesture())
                
            }
            
            
            Button {
                
                switch tabSelection {
                    
                case .phoneNumber:
                    
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
                    
                case .phoneVerification:
                    
                    buttonDisabled.toggle()
                    
                    userManager.verifyCode(code: userManager.verificationCode) { error in
                        
                        if error == nil {
                            
                            // Check if user has a profile
                            userManager.checkUserProfile { exists in
                                if exists {
                                    
                                    userManager.loggedIn = true
                                    
                                }
                                
                                else {
                                    tabSelection = .phoneVerification
                                }
                            }
                            
                        }
                        
                        else {
                            
                            // Show error
                            print(error as Any)
                        }
                        
                    }
                    
                }
            }
            
            
            
        label: {
            
            ZStack {
                
                Rectangle()
                    .foregroundColor(Color.theme.accent)
                    .frame(height: 48)
                    .cornerRadius(10)
                
                switch tabSelection {
                case .phoneNumber:
                    Text("Next")
                case .phoneVerification:
                    Text("Verify")
                }
                
            }
        }
        .padding()
        .accentColor(Color.theme.background)
        .disabled(buttonDisabled)
            
            
        }
        .background(Color.theme.red)
        .disabled(buttonDisabled)
        
        
        //        NavigationView {
        //            Form {
        //
        //                Section {
        //                    TextField("Email", text: $userManager.email)
        //                    SecureField("Password", text: $userManager.password)
        //
        //                }
        //
        //                if userManager.errorMessage != nil {
        //                    Section {
        //                        Text(userManager.errorMessage!)
        //
        //                    }
        //                }
        //
        //                Button {
        //       //             userManager.signIn()
        //                } label: {
        //
        //                    HStack{
        //                        Spacer()
        //                        Text("Sign In")
        //                        Spacer()
        //                    }
        //                }
        //            }
        //            .navigationTitle("Sign In")
        //        }
    }
}

struct LoginForm_Previews: PreviewProvider {
    static var previews: some View {
        LoginForm()
    }
}
