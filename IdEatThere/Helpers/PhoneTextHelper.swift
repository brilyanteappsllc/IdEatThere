//
//  PhoneTextHelper.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/12/23.
//

import Foundation


class PhoneTextHelper {
    
    
    static func sanitizePhoneNumber(phone: String) -> String {
        
        
        return phone
            .replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
            .replacingOccurrences(of: "-", with: "")
            .replacingOccurrences(of: " ", with: "")
        
        
    }
}
