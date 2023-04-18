//
//  SortList.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 4/17/23.
//

import Foundation


enum SortOptions : String, CaseIterable, Equatable {
    
    case none = "best_match",
         distance,
         rating,
         reviews = "review_count"
    
    
    var imageName : String {
        
        switch self {
        case .none:
            return "network"
        case .distance:
            return "car.circle"
        case .rating:
            return "star.circle"
        case .reviews:
            return "envelope.open"
        }
    }
    
    var alias : String {
        
        switch self {
        case .none:
            return "None"
        case .distance:
            return "Distance"
        case .rating:
            return "Ratings"
        case .reviews:
            return "Reviews"
        }
    }
}
