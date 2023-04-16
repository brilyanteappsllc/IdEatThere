//
//  PhoneNumberView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/10/23.
//

import SwiftUI
import Combine

struct PhoneNumberView: View {
    
    @EnvironmentObject var userManager : UserManagerModel
    
    var body: some View {

            VStack {
                Text("Phone")
                    .bold()
                    .font(.title)
                    .padding(.top, 52)
                
                Text("Enter your mobile number below, we'll send you a verification code after via sms.")
                    .padding(.top, 12)
                    .font(.body)
                
                    
                TextField(userManager.phone.isEmpty ? " e.g. (613) 515-0123 " : userManager.phone, text: $userManager.phone)
                        .textFieldStyle(OnboardingTextFields())
                        .keyboardType(.numberPad)
                        .padding(.horizontal)
                        .foregroundColor(Color.accentColor)
//                TextField(userManager.phone.isEmpty ? " e.g. (613) 515-0123 " : userManager.phone, text: $userManager.phone.applyPatternOnNumbers(userManager.phone, pattern: "(###) ###-####", replacementCharacter: "#"))
//                        .textFieldStyle(OnboardingTextFields())
//                        .keyboardType(.numberPad)
//                        .padding(.horizontal)
//                        .foregroundColor(Color.accentColor)
            
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
