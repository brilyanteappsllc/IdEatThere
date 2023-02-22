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
            
            ZStack {
                ScrollView {
                    
                    VStack {
                        // User Profile Info
                        HStack {
                            Spacer()
                            AsyncImage(url: photoURL) { phase in
                                
                                switch phase {
                                    
                                case .empty :
                                    
                                    ZStack {
                                        Circle()
                                            .foregroundColor(.white)
                                        
                                        Text(userModel.firstName.prefix(1) ?? "")
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
                                        
                                        Text((userModel.firstName.prefix(1) ?? ""))
                                            .bold()
                                    }
                                }
                            }
                         //   .frame(width: 44, height: 44)
                        //    .resizable()
                                .frame(width: 100, height: 100)
                               // .cornerRadius(100)
                            Spacer()
                            VStack{
                                Text(String("\(userModel.firstName)"))
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
