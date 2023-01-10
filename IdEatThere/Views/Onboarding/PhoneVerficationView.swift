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
            Spacer()
            
            Text("Verification")
                .bold()
                .font(.title)
            
            Text("Enter the 6-digit verification code we sent to your device")
                .padding(.top, 12)
                .font(.body)
            
            ZStack {
                
                Rectangle()
                    .foregroundColor(.white)
                    .frame(height: 48)
                    .cornerRadius(10)
                
                HStack {
                    TextField(" e.g. 123456 ", text: $userManager.verificationCode)

                }

            }
            .padding(.horizontal)
            
                if userManager.errorMessage != nil {
                    Section {
                        Text(userManager.errorMessage!)
                        
                    }
                }
            
            
            
            Text("By tapping 'Verify' you agree to our privacy policy")
                .multilineTextAlignment(.center)
                
          
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
