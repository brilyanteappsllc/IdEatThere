//
//  LogoutForm.swift
//  thepleasuredpussies
//
//  Created by Brilyante Apps LLC on 3/28/22.
//

import SwiftUI
import FirebaseAuth

struct LogoutForm: View {
    
    @EnvironmentObject var userManager : UserManager
    
    var body: some View {
        

            HStack {
                
                Button {
                    try! Auth.auth().signOut()
                    userManager.loggedIn = false
                } label: {Text("Sign out")}
                
                
            }
        
        
    }
    
}
