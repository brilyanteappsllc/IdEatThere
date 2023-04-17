//
//  SortList.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 4/17/23.
//

import Foundation


enum SortOptions : String, CaseIterable, Equatable {
    
    case none,
         distance,
         rating,
         reviews
    
    
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
    
    var alies : String {
        
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
