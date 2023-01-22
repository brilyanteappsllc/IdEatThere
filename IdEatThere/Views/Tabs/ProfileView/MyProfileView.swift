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
                                Text(String("\(userManager.firstName)"))
                                    .bold()
                                    .foregroundColor(Color.theme.accent)

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

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}
