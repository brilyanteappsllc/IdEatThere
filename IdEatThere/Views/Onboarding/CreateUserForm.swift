//
//  CreateUserForm.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

struct CreateUserForm: View {
    
    @EnvironmentObject var userManager : UserManager
        
        var body: some View {
            
            NavigationView {
                Form {
                    
                    Section {
                        TextField("Email", text: $userManager.email)
                        TextField("Name", text: $userManager.name)
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
                
            }
            
        }
}

struct CreateUserForm_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserForm()
    }
}
