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
                Spacer()
                
                Text("Verification")
                    .bold()
                    .font(.title)
                
                Text("Enter your mobile number below, we'll send you a verification code after.")
                    .padding(.top, 12)
                    .font(.body)
                
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    
                    HStack {
                        TextField(" e.g. +1 613 515 0123 ", text: $userManager.phone)
    
                    }
 
                }
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
