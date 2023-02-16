//
//  MyGroupsModel.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/9/23.
//

import Foundation
import Combine
import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseStorage


class MyGroupsModel : ObservableObject {
    
    
    
    @Published var hasGroups : Bool = true

    @Published var groupsArray = [Groups]()
    
    private var groupId = ""
    
    private let groupsDataService = GroupsDataService()
    private var cancellables = Set<AnyCancellable>()
    
    let db = Firestore.firestore()
    
    
//    init() {
//
//        addSubscribers()
//    }
    
    
    func queryGroupsAttending() {
        
        DispatchQueue.init(label: "getUserGroups").async {
            
            
            
            UserManagerModel().userGroups() {groupsAttending in
                
                // Update the UI in the main thread
                
                DispatchQueue.main.async {
                    self.groupsArray = groupsAttending
                    print(self.groupsArray)
                }
            }
        }
        
    }

    
    
    func addSubscribers() {
        
        
//        groupsDataService.$groupsArray
//            .sink { [weak self] (returnedgroupsArray) in
//                self?.groupsArray = returnedgroupsArray
//            }
//            .store(in: &cancellables)
 
    }
    
}
