//
//  GroupTest.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 2/23/23.
//

import Foundation
import FirebaseFirestoreSwift



struct Groupssssssss : Codable, Identifiable {
    
    @DocumentID var id : String?
    var groupName : String?
    var groupCount : Int?
 //   var host : [Hosts]?
    var attendees : Attendees?
//    var restaurants : [Restaurants]?
//    var reservations : [Reservations]?
//    var votes : [Votes]?

}

//struct Hosts : Codable, Identifiable {
//
//    @DocumentID var id : String?
//}

struct Attendees : Codable, Identifiable {
    
    @DocumentID var id : String?
    var userNames : [String]?
    
}

//struct Restaurants : Codable, Identifiable {
//
//    @DocumentID var id : String?
//
//}
//
//struct Votes : Codable, Identifiable {
//
//    @DocumentID var id : String?
//
//}
//
//struct Reservations : Codable, Identifiable {
//
//    @DocumentID var id : String?
//
//
//}
