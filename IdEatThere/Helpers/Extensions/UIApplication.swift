//
//  UIApplication.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/6/23.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        
    }
}
