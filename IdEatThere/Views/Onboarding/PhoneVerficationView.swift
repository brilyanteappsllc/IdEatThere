//
//  PhoneVerficationView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/10/23.
//

import SwiftUI

struct PhoneVerficationView: View {
    
    @EnvironmentObject var userManager : UserManagerModel
    
    
    var body: some View {
        
        VStack {
          
            Text("Verification")
                .bold()
                .font(.title)
                .padding(.top, 52)
            
            Text("Enter the 6-digit verification code we sent to your device")
                .padding(.top, 12)
                .font(.body)
            

            TextField(" e.g. 123456 ", text: $userManager.verificationCode)
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

struct PhoneVerficationView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneVerficationView()
            .environmentObject(UserManagerModel())
    }
}
