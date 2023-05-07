//
//  DateExtension.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 5/7/23.
//

import Foundation

extension Date {
    
    func diff(numDays: Int) -> Date {
        
        Calendar.current.date(byAdding: .day, value: numDays, to: self)!
    }
    
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
}
