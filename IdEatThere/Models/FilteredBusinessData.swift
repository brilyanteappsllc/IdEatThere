//
//  FilteredBusinessData.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/4/23.
//

import Foundation
import SwiftUI


struct FilteredTagData : Identifiable {
    
 
    
    
    var id = UUID()
    var imageName : String
    var title : String
    var isSelected : Bool = false
    var isReviewsSelected : Bool = false
    var isStarsSelected : Bool = false
    var isIsOpenSelected : Bool = false
    var filter : RestaurantsContentModel.filterOption
    
}
