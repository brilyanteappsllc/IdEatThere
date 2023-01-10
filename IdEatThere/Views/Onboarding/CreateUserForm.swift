//
//  CreateUserForm.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

struct CreateUserForm: View {
    
    @EnvironmentObject var userManager : UserManagerModel
        
        var body: some View {
            
            
                VStack {
                    Spacer()
                    
                    Text("Verification")
                        .bold()
                        .font(.title)
                    
                    Text("Enter your mobile number below, we'll send you a verification code after.")
                        .padding(.top, 12)
                        .font(.body)
                    

                        Section {
                      //      TextField("Name :", text: $userManager.name)
                      //      TextField("Email: ", text: $userManager.email)
                            TextField("e.g. +1 613 515 0123 ", text: $userManager.phone)
                      //      SecureField("Password: ", text: $userManager.password)
                        }
                        .padding(.horizontal)
                        .padding(.top, 12)
                        .padding(.bottom, 12)
                    
                        if userManager.errorMessage != nil {
                            Section {
                                Text(userManager.errorMessage!)
                                
                            }
                        }
                        
                        
                        Button {
                            userManager.createAccount()
                        } label: {
                            ZStack {
                                Rectangle()
                                    .frame(height: 56)
                                HStack {
                                    Spacer()
                                    Text("Create Account")
                                        .foregroundColor(Color.theme.blackText)
                                    Spacer()
                                }
                            }}
                        
                    .navigationTitle("Create Account")
                    Spacer()
                    
                    // TODO: create hyperlink to privacy policy
                    Text("By tapping 'Create Account' you agree to our privacy policy")
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal)
        }
}

struct CreateUserForm_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserForm()
            .environmentObject(UserManagerModel())
    }
}
