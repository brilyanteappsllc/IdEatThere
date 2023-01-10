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
            
            NavigationView {
                VStack {
                    Form {
                        
                        Section {
                            TextField("Name", text: $userManager.name)
                            TextField("Email", text: $userManager.email)
                            // Phone #
                            SecureField("Password", text: $userManager.password)
                        }
                        if userManager.errorMessage != nil {
                            Section {
                                Text(userManager.errorMessage!)
                                
                            }
                        }
                        
                        
                        Button {
                            userManager.createAccount()
                        } label: {
                            HStack {
                                Spacer()
                                Text("Create Account")
                                Spacer()
                            }
                        }
                        
                    }
                    .navigationTitle("Create Account")
                    
                    // TODO: create hyperlink to privacy policy
                    Text("By creating an account you agree to our privacy policy")
                        .multilineTextAlignment(.center)
                        Spacer()
                }
            }
            
        }
}

struct CreateUserForm_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserForm()
            .environmentObject(UserManagerModel())
    }
}
