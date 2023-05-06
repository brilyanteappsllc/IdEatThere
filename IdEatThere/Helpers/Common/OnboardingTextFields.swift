//
//  OnboardingTextFields.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/11/23.
//

import Foundation
import SwiftUI


struct OnboardingTextFields : TextFieldStyle {
    
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        
        
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
                .frame(height: 48)
                .cornerRadius(10)
            
                configuration
                .padding(.horizontal)

        }
        .padding(.horizontal)
        
    }
    
    
}

struct VerificationCodeTextField : TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            VStack {
                Spacer()
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 40, height: 2)
            }
            .frame(height: 60)
            configuration
                .font(.system(size: 50))
                .padding(.leading, 10)
        }
    }
    
}
