//
//  SortList.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 4/17/23.
//

import Foundation


enum AttributeOptions : String, CaseIterable, Equatable {
    
    // Sending request to Yelp api for certain filters
    
    case none,
         deals,
         genderNeutralRestrooms,
         hotAndNew,
         takesReservations
    
    var imageName : String {

        switch self {
        
        case .none :
            return "network"
        case .deals :
            return "dollarsign.square"
        case .genderNeutralRestrooms :
            return "person.circle"
        case .hotAndNew :
            return "thermometer.sun"
        case .takesReservations :
            return "phone"
        }
    }
    
    var alias: String {
        switch self {
        case .none:
            return "None"
        case .deals:
            return "Deals"
        case .genderNeutralRestrooms:
            return "Gender Neutral Restrooms"
        case .hotAndNew:
            return "Hot and New"
        case .takesReservations:
            return "Takes Reservations"
        }
    }
    
}

