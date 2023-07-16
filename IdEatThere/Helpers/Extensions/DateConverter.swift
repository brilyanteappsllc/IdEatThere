//
//  DateConverter.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 7/16/23.
//

import Foundation

class DateConverter {
    
    func formatDateToString(date: Date) -> String? {
        
        // Create Date Formatter
        let dateFormatter = DateFormatter()

        // Set Date Format
        dateFormatter.dateFormat = "YY/MM/dd"

        // Convert Date to String
        let returnDate = dateFormatter.string(from: date)
        
        return returnDate
        
    }
    
    func formattedDateFromString(dateString: String, withFormat format: String) -> String? {
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yy/mm/dd"
        
        if let date = inputFormatter.date(from: dateString) {
            
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = format
            
            return outputFormatter.string(from: date)
        }
        
        return nil
    }
    
    
}
