//
//  EditUserProfileButton.swift
//  thepleasuredpussies
//
//  Created by Brilyante Apps LLC on 4/4/22.
//

import SwiftUI

struct EditUserProfileButton: View {
    
    @EnvironmentObject var userManager: UserManagerModel
    
    var body: some View {
        Button {
            // Edit Profile
            userManager.editUserInformation = true
        } label: {
            ZStack {
                Rectangle()
                    .frame(height: 30)
                    .cornerRadius(15)
                Text("Edit Profile")
            }
        }
        .cornerRadius(10)
        .shadow(radius: 2)
        .foregroundColor(.black)
        .sheet(isPresented: $userManager.editUserInformation, onDismiss: userManager.saveFirstName) {
            EditUserProfileForm()
        }
    }
}

struct EditUserProfileButton_Previews: PreviewProvider {
    static var previews: some View {
        EditUserProfileButton()
            .environmentObject(UserManagerModel())
    }
}
