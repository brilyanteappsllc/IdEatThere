//
//  LoginForm.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

struct LoginForm: View {
    
    @EnvironmentObject var userManager : UserManagerModel
    var body: some View {
        
        NavigationView {
            Form {
                
                Section {
                    TextField("Email", text: $userManager.email)
                    SecureField("Password", text: $userManager.password)
                    
                }
                
                if userManager.errorMessage != nil {
                    Section {
                        Text(userManager.errorMessage!)
                        
                    }
                }
                
                Button {
                    userManager.signIn()
                } label: {
                    
                    HStack{
                        Spacer()
                        Text("Sign In")
                        Spacer()
                    }
                }
            }
            .navigationTitle("Sign In")
        }
        
        
    }
}

struct LoginForm_Previews: PreviewProvider {
    static var previews: some View {
        LoginForm()
    }
}
