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
            
            TextField(userManager.verificationCode.isEmpty ? " 123456 " : userManager.verificationCode, text: $userManager.verificationCode)
                    .textFieldStyle(OnboardingTextFields())
                    .keyboardType(.numberPad)
                    .foregroundColor(Color.accentColor)
                    .shadow(radius: 2)
            
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
