//
//  LogoutForm.swift
//  thepleasuredpussies
//
//  Created by Brilyante Apps LLC on 3/28/22.
//

import SwiftUI
import FirebaseAuth

struct LogoutForm: View {
    
    
    
    var body: some View {
        

            HStack {
                
                Button {
                    
                    UserManagerModel().signOut()
                    
                } label: {Text("Sign out")}
                
                
            }
        
        
    }
    
}
