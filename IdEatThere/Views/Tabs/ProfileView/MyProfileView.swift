//
//  MyProfileView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

struct MyProfileView: View {
    
    @EnvironmentObject var userManager : UserManagerModel
    
    var body: some View {
       
        if userManager.loggedIn == false {
            
 
                // - Sign in -
            Button {
                
                // - Login Form -
                userManager.loginFormShowing = true
                
            } label: {
                Text("Sign In")}
            .sheet(isPresented: $userManager.loginFormShowing, onDismiss: userManager.checkLogin) {
                LoginForm()
            }
            .onAppear {
                userManager.checkLogin()
            }
            }
        
        else {
            
            ZStack {
                ScrollView {
                    
                    VStack {
                        // User Profile Info
                        HStack {
                            Spacer()
                            Image("logo")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(100)
                            Spacer()
                            VStack{
                                Text(String("\(userManager.name)"))
                                    .bold()
                                    .foregroundColor(Color("Sand Blush"))

                                Spacer()
                                
                                HStack {
                                    Spacer()
                                    // Edit Profile
                                    EditUserProfileButton()
                                    Spacer()
                                    
                                    // Sign out
                                    LogoutForm()
                                    Spacer()
                                }
      
                                

                            }
                            Spacer()
                            
                        }
                        .padding(.top, 70.0)
                        
                        Spacer()

                    }
                    
                }
               
            }
            
            
        }

    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}
