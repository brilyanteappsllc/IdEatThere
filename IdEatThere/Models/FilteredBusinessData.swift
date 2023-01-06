//
//  FilteredBusinessData.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/4/23.
//

import Foundation
import SwiftUI


struct FilteredTagData : Identifiable {
    
    enum filter {
        case none, reviews, stars, isOpen
    }
    
    
    var id = UUID()
    var imageName : String
    var title : String
    var isSelected : Bool = false
    var isReviewsSelected : Bool = false
    var isStarsSelected : Bool = false
    var isIsOpenSelected : Bool = false
    var filter : filter
    
}
