//
//  CalendarEvent.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 4/21/23.
//

import Foundation


  
enum CalendarEventType: String, CaseIterable, Equatable {
        
    case social, date, business, celebration, unspecified
        
        var icon: String {
            switch self {
            case .social:
                return "🍺"
            case .date:
                return "❣️"
            case .business:
               return "🤝"
            case .celebration:
               return "🎉"
            case .unspecified:
               return "🗓"
            }
            
        }
    
    var type: String {
        
        switch self {
        case .social:
            return "Social"
        case .date:
            return "Date"
        case .business:
            return "Business"
        case .celebration:
            return "Celebration"
        case .unspecified:
            return "Unspecified"
        }
    }
}
