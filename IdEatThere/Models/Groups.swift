//
//  Group.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 2/16/23.
//

import Foundation
import FirebaseFirestoreSwift


struct Groups : Codable, Identifiable {
    
    @DocumentID var id : String?
    var groupName : String?
    var Attendees : [String]?
 //   var selectedRestaurant : String?
//    var reservationTime : Date?
 //   var suggestedRestaurants : [String?]
 //   var topRestaurants : [String?]
 //   var groupTotal : Int?

}
