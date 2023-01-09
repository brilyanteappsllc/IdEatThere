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
        
        ZStack {
            VStack {
                Spacer()
                Text(String("\(userManager.name)"))
    
                Section {
                TextField("Name", text: $userManager.name)
                        
                }
                Spacer()
                Section {
                    Button {
                        userManager.saveFirstName()
                    } label: {
                        Text("Save")
                            .foregroundColor(.white)
                    }

                }
                Spacer()
                
 
            } // End of Lazy V
        }
        
    }
}

struct EditUserProfileForm_Previews: PreviewProvider {
    static var previews: some View {
        EditUserProfileForm()
            .environmentObject(RestaurantsContentModel())
    }
}
