//
//  FoodCategories.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 4/15/23.
//

import Foundation


enum FoodCategory: String, CaseIterable, Equatable {
    case all, coffee, beer
    case icecream = "icecream"
    case breakfast, donuts
    
    var emoji: String {
        switch self {
        case .all:
            return "\u{1F959}"
        case .coffee:
            return "\u{2615}"
        case .beer:
            return "\u{1F37A}"
        case .icecream:
            return "\u{1F366}"
        case .breakfast:
            return "\u{1F95E}"
        case .donuts:
            return "\u{1F369}"
        }
    }
    
    var displayText : String {
        
        
        switch self {
        case .all:
            return "All"
        case .coffee:
            return "Coffee"
        case .beer:
            return "Drinks"
        case .icecream:
            return "Ice Cream"
        case .breakfast:
            return "Breakfast"
        case .donuts:
            return "Donuts"
        }
    }
    
    var alias: String {
        switch self {
        case .all:
            return "restaurants"
        case .coffee:
            return "coffee"
        case .beer:
            return "beer_and_wine"
        case .icecream:
            return "icecream"
        case .breakfast:
            return "breakfast_brunch"
        case .donuts:
            return "donuts"
        }
    }
}
