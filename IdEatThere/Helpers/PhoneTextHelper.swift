//
//  PhoneTextHelper.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/12/23.
//

import Foundation
import SwiftUI


class PhoneTextHelper {
    
    
    static func sanitizePhoneNumber(phone: String) -> String {
        
        
        return phone
            .replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
            .replacingOccurrences(of: "-", with: "")
            .replacingOccurrences(of: " ", with: "")

    }
    
//    static func limitText(_ stringvar: inout String, _ limit: Int) {
//
//        if (stringvar.count > limit) {
//            stringvar = String(stringvar.prefix(limit))
//
//        }
//
//    }
}

extension Binding where Value == String {
    func max(_ limit: Int) -> Self {
        if self.wrappedValue.count > limit {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.dropLast())
            }
        }
        return self
    }
}

extension Binding where Value == String {
    
    func applyPatternOnNumbers(_ phone : String, pattern: String, replacementCharacter: Character) -> Self {
        
        var pureNumber = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        
        for index in 0 ..< pattern.count {
            
            guard index < pureNumber.count else { return self }
                
            let strindIndex = String.Index(utf16Offset: index, in: pattern)
            let patternCharacter = pattern[strindIndex]
            guard patternCharacter != replacementCharacter else {
                continue
            }
            
            pureNumber.insert(patternCharacter, at: strindIndex)
            
            
            DispatchQueue.main.async {
                self.wrappedValue = String(pureNumber)
            }
         
            }
        
        return self
    }
}
