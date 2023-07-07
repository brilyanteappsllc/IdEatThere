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
        NavigationLink {
            // Edit Profile
            EditUserProfileForm()
        } label: {
            ProfileButton(buttonName: "Edit Profile")
        }
//        .sheet(isPresented: $userManager.editUserInformation, onDismiss: userManager.saveFirstName) {
            
        }
}

struct EditUserProfileButton_Previews: PreviewProvider {
    static var previews: some View {
        EditUserProfileButton()
            .environmentObject(UserManagerModel())
    }
}
