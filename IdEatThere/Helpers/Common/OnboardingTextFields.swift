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

        }
        .padding(.horizontal)
        
    }
    
    
}
