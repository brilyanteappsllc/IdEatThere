//
//  CreateProfileView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/10/23.
//

import SwiftUI

struct CreateProfileView: View {
    
    @EnvironmentObject var userManager : UserManagerModel
    
    var body: some View {
        
        VStack {
            
            
            Text("Set Up Profile")
                .bold()
                .font(.title)
                .padding(.top, 52)
            
            Text("Just a few more details to get started")
                .padding(.top, 12)
                .font(.body)
            
            // Profile Image Button
            Button {
                
                // Show action sheet
                
            } label: {
                
                ZStack {
                    
                    Circle()
                        .foregroundColor(.white)
                    
                    Circle()
                        .stroke(Color.theme.red, lineWidth: 2)
                    
                    Image(systemName: "camera.fill")
                        .foregroundColor(Color.theme.accent)
                    
                    
                }
                .frame(width: 134, height: 134)
                .padding(.top, 50)
                
            }
            

            TextField(" First Name ", text: $userManager.name)
                .textFieldStyle(OnboardingTextFields())
                .padding(.top, 50)


            
   
            TextField(" Last Name ", text: $userManager.lastName)
                .textFieldStyle(OnboardingTextFields())


            
                if userManager.errorMessage != nil {
                    Section {
                        Text(userManager.errorMessage!)
                        
                    }
                }
                
            Spacer()

        }
        .padding(.horizontal)
    }
}

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView()
            .environmentObject(UserManagerModel())
    }
}
