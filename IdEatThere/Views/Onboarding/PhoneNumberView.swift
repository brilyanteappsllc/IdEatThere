//
//  PhoneNumberView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/10/23.
//

import SwiftUI

struct PhoneNumberView: View {
    
    @EnvironmentObject var userManager : UserManagerModel
    var body: some View {

            VStack {
                
                
                Text("Verification")
                    .bold()
                    .font(.title)
                    .padding(.top, 52)
                
                Text("Enter your mobile number below, we'll send you a verification code after.")
                    .padding(.top, 12)
                    .font(.body)
                
 
                TextField(" e.g. +1 613 515 0123 ", text: $userManager.phone)
                    .textFieldStyle(OnboardingTextFields())

                .padding(.horizontal)
                
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

struct PhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberView()
            .environmentObject(UserManagerModel())
    }
}
