//
//  MyProfileView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

struct MyProfileView: View {
    
    @EnvironmentObject var userModel: UserManagerModel
    
    var body: some View {

        
        let photoURL = URL(string: userModel.profilePhoto ?? "")
            
            ZStack( ) {
                ScrollView {
                    
                    VStack {
                        // User Profile Info
                        HStack {
                            
//                            Spacer()
                            
                            AsyncImage(url: photoURL) { phase in
                                
                                switch phase {
                                    
                                case .empty :
                                    
                                    ZStack {
                                        Circle()
                                            .foregroundColor(.white)
                                        
                                        Text(userModel.firstName.isEmpty ? "M" : userModel.firstName.prefix(1) )
                                            .bold()
                                    }
                                case .success(let image):
                                    
                                    //Display the fetched image
                                    image
                                        .resizable()
                                        .scaledToFit()
                                    
                                case .failure (let error):
                                    // Couldn't fetch photo url
                                    // Display a cirlce with first letter of first name
                                    
                                    ZStack {
                                        Circle()
                                            .foregroundColor(.white)
                                        
                                        Text(userModel.firstName.isEmpty ? "M" : userModel.firstName )
                                            .bold()
                                    }
                                }
                            }
                            //   .frame(width: 44, height: 44)
                            //    .resizable()
                            .frame(width: 100, height: 100)
                            // .cornerRadius(100)
                            
                            Spacer()
                            
                            Text(String("\(userModel.firstName.isEmpty ? "Matthew" :userModel.firstName)"))
                                .bold()
                                .foregroundColor(Color.theme.accent)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                                
                        HStack {
                                Spacer()
                                // Edit Profile
                                NavigationLink {
                                    EditUserProfileForm()
                                } label: {
                                    ProfileButton(buttonName: "Edit Profile")
                                }
                                Spacer()
                                
                                // Sign out
                                NavigationLink {
                                    LogoutForm()
                                } label: {
                                    ProfileButton(buttonName: "Logout")
                                }
                                Spacer()
                            }
                        .padding(.horizontal)
      
                            
                        }
                    
                        DashedDivider()
                        
                        Spacer()

                    }
                    
                    
                } .onAppear{
                userModel.userInfo()
            }
            

    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
            .environmentObject(UserManagerModel())
    }
}
