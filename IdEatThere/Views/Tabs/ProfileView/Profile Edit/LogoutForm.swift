//
//  LogoutForm.swift
//  thepleasuredpussies
//
//  Created by Brilyante Apps LLC on 3/28/22.
//

import SwiftUI
import FirebaseAuth

struct LogoutForm: View {
    
    @EnvironmentObject var userManagerModel : UserManagerModel
    
    var body: some View {
        

            HStack {
                
                Button {
                    
                    self.userManagerModel.signOut()
                    
                } label: {Text("Sign out")}
                    .padding(5)
                    .padding(.horizontal, 15)
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                    .foregroundColor(.black)
                
                
            }
        
        
    }
    
}
