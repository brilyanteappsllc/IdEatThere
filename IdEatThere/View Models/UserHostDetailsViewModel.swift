//
//  UserHostDetailsViewModel.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 2/23/23.
//

import Foundation
import Combine
import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseStorage


class UserHostDetailsModel : ObservableObject {
    
    @Published var userHostName = ""
    
    let db = Firestore.firestore()
    
    
    // MARK: - Get Host Name
    func hostName(hostId: String) {
        
        
        DispatchQueue.init(label: "getHostName").async {
            
            
            self.getHostDetails(hostId: hostId) { hostName in
                
                // Update the UI in the main thread
                
                DispatchQueue.main.async {
                    self.userHostName = hostName

                }
            }
        }
        
    }
    
    
    func getHostDetails(hostId: String, completion: @escaping (String) -> Void) {
        
        let username = db.collection("users").document(hostId)
        username.getDocument { snapshot, error in
            
            
            if error == nil && snapshot != nil {
                
                if let user = try? snapshot?.data(as: User.self) {
                    
                    var hostName = user.firstName ?? ""
                    
                    completion(hostName)
                    
                }
                
                
            }
            
        }
    }
    
    
}
