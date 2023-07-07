//
//  EditUserProfile.swift
//  thepleasuredpussies
//
//  Created by Brilyante Apps LLC on 3/31/22.
//

import SwiftUI
import FirebaseAuth

struct EditUserProfileForm: View {
    
    @EnvironmentObject var userManager: UserManagerModel
    var body: some View {
        
        
        

        VStack {
            Form {
                
                Section(header: Text("Name")) {
                    TextField("Name", text: $userManager.firstName)
                    
                    
                }
                Section {
                    Button {
                        userManager.saveFirstName()
                    } label: {
                        Text("Save")
                            .foregroundColor(.white)
                    }
                    
                }
                Spacer()
            }

        } // End of Lazy V
  
        .padding(.horizontal)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            
            ToolbarItem(placement: .principal) {
                HStack {
                    //TODO: Add image for the group
                    //                        Image(systemName: "fork.knife.circle.fill")
                    //                            .font(.system(size: 25))
                    Text("Edit Profile")
                        .font(Font.headingFont)
                }
                .padding(.top, 10)
            }
            
            
        }
        
    }
}

struct EditUserProfileForm_Previews: PreviewProvider {
    static var previews: some View {
        EditUserProfileForm()
            .environmentObject(RestaurantsContentModel())
    }
}
