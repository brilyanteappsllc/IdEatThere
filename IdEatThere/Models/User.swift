//
//  User.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/12/23.
//

import Foundation
import FirebaseFirestoreSwift

struct User : Codable, Identifiable {
    
    @DocumentID var id : String?
    
    var firstName : String?
    var lastName : String?
    var phone : String?
    var newUser: Bool?
    var photo: String?
    var calendarEvents : [CalendarEvents]
    

}

struct CalendarEvents : Codable, Identifiable {
    @DocumentID var id : String?
    var groupName : String?
    var groupType : String?
    @ServerTimestamp var date : Date?
    
}
