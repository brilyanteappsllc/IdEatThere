//
//  Group.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 2/16/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


struct Groups : Codable, Identifiable {
    
    @DocumentID var id : String?
    var groupName : String?
    var groupType : String?
    var attendees : [String]?
    var host : [String]?
    @ServerTimestamp var date : Date?
    var restaurantsList : [RestaurantsList]?

}


struct RestaurantsList : Codable, Identifiable {
    
    @DocumentID var id : String?
    
    var restaurantAlias : String?
    var restaurantId : String?
    var voteCount : Int?
    var restaurantName : String?
    var suggestorId : String?
    
}
