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

    @Published var groupsAttending = [Groups]()
    @Published var groupsHosting = [Groups]()
    @Published var groupsHostDetails = [User]()
    @Published var groupsRestaurantDetails = [Business]()
    
    private var groupId = ""
    
//    private let groupsDataService = GroupsDataService()
//    private var cancellables = Set<AnyCancellable>()
    
    let db = Firestore.firestore()
    
    
//    init() {
//
//        addSubscribers()
//    }
    
    // MARK: - Queries
    func queryGroupsAttending() {
        
        DispatchQueue.init(label: "getUserGroupsAttending").async {
            
            
            UserManagerModel().userGroupsAttending() {groupsAttending in
                
                // Update the UI in the main thread
                
                DispatchQueue.main.async {
                    self.groupsAttending = groupsAttending
                    self.hasGroups = true
//                    print(self.hasGroups)
//                    print(self.groupsAttending)

                }
            }
        }
    }
    
    func queryGroupsHosting() {
        
        DispatchQueue.init(label: "getUserGroupsHosting").async {
            
            
            UserManagerModel().userGroupsHosting() {groupsHosting in
                
                // Update the UI in the main thread
                DispatchQueue.main.async {
                    self.groupsHosting = groupsHosting
//                    print(self.groupsHosting)
                }
                
            }
        }
        
    }
    
    func queryRestaurantsInGroups() {
        // Creates a query from the names of restaurants in firebase to yelp and outputs all the info into the user groups
        
        
        
        
    }
    
    // MARK: - Add Restaurants to Group
    func addRestaurantNameToMyGroup(groupId: String, restaurantName : String) {
        // Restaurant Name is stored in firebase
        
        DispatchQueue.init(label: "userAddedRestaurantToGroup").async {
            
            UserManagerModel().userAddedRestauranttoGroup(groupId: groupId, restaurantName: restaurantName) { success in
                
                
                

                
                
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
