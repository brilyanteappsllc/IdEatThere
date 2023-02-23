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
    var attendees : [String]?
    var host : [String]?
    var restaurants : [String]?

}
