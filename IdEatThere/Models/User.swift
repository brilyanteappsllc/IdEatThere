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
    var photo: String?

}
