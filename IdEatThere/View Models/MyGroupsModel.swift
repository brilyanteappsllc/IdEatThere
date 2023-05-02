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
    @Published var groupsRestaurantsList = [RestaurantsList]()
    @Published var groupsRestaurantDetails : Business?
    
    @Published var allGroupsIn = [Groups]()
    
    // Setting up initial group details
    @Published var groupName = ""
    @Published var datePicked = Date()
    @Published var groupPhoto : UIImage?
    @Published var allowInvitesToGroup = false
    
    private var groupId = ""
    private var userId = ""
    
//    private let groupsDataService = GroupsDataService()
//    private var cancellables = Set<AnyCancellable>()
    
    let db = Firestore.firestore()
    
    
    // Computed date converter from firebase timestamp -> Month DD, YYYY at HH:MM AM/PM
    let date: Date
    let dateFormatter: DateFormatter
    
    init() {
        date = Date()
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
    }
    
    
//    init() {
//
//        addSubscribers()
//    }
    
    // MARK: - Ensure login, get userId
    func checkLogin() -> Bool {
        let loggedin = Auth.auth().currentUser == nil ? false : true
 //       self.userInfo()
        
        return loggedin
    }
    
    func getLoggedInUserId() -> String {
        let userId = Auth.auth().currentUser?.uid ?? ""
        
        return userId
        
    }
    
    
    // MARK: - Queries
    func queryGroupsAttending() {
        
        // Ensure user is logged in
        guard self.checkLogin() != false else {
            
            // Use is not logged in
            return
        }
        
        self.userId = self.getLoggedInUserId()
        
        
        
        DispatchQueue.init(label: "getUserGroupsAttending").async {
            
            
            GroupsDataService().userGroupsAttending(userId: self.userId) {groupsAttending in
                
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
        
        
        // Ensure user is logged in
        guard self.checkLogin() != false else {
            
            // Use is not logged in
            return
        }

        self.userId = self.getLoggedInUserId()
        
        DispatchQueue.init(label: "getUserGroupsHosting").async {
            
            
            GroupsDataService().userGroupsHosting(userId: self.userId) {groupsHosting in
                
                // Update the UI in the main thread
                DispatchQueue.main.async {
                    self.groupsHosting = groupsHosting
//                    print(self.groupsHosting)
                }
                
            }
        }
        
    }
    
    func queryRestaurantsInGroups(groupsId : String) {
        // Creates a query from the names of restaurants in firebase to yelp and outputs all the info into the user groups
        
        // Ensure user is logged in
        guard self.checkLogin() != false else {
            
            // Use is not logged in
            return
        }
        
        
        DispatchQueue.init(label: "getRestaurantList").async {
            
            
            self.list(groupsId: groupsId ) { groupsRestaurantList in
                self.groupsRestaurantsList = groupsRestaurantList
            }
        }
        
        
        
    }
    
    func list(groupsId: String, completion: @escaping ([RestaurantsList]) -> Void) {
        
        let restuarantQuery = db.collection("groups").document(groupsId).collection("restaurantsList")
        
        restuarantQuery.getDocuments { snapshot, error in
            
            if snapshot != nil && error == nil {
                
                var restaurants = [RestaurantsList]()
                
                // Loop through returned restaurant docs
                for doc in snapshot!.documents {
                    
                   let restaurant = try? doc.data(as: RestaurantsList.self)
                    
                    if let restaurant = restaurant {
                        
                        restaurants.append(restaurant)
                    }
                }
                
                completion(restaurants)
                
            }
            
        }
    }
    
    func querySelectedGroupsDetails(groupsId: String, completion: @escaping (Groups) -> Void) {
        
        
        
        
    }
    // MARK: - Yelp API Requests
    
    func apiRequestDetails(forId id : String) {
        
        let live = YelpAPIService.live
        
        let details = live
            .businessDetails(.detail(id: id))
 //           .share()
        
        details
            .assign(to: &$groupsRestaurantDetails)

    }
    
    // MARK: - Create Group Form
    
    func createGroup(groupName: String, groupType: String, groupPhoto: UIImage?, datePicked: Date, allowInvites: Bool, completion: @escaping (Error?) -> Void) {
        
        // Ensure user is logged in
        guard self.checkLogin() != false else {
            
            // Use is not logged in
            return
        }
        
        
        // Get userId
        self.userId = getLoggedInUserId()
        
        DispatchQueue.init(label: "getUserGroupsHosting").async {
            
            
            GroupsDataService().userCreatesGroup(userId: self.userId, groupName: groupName, groupType: groupType, groupPhoto: groupPhoto, datePicked: datePicked, allowInvites: allowInvites) { error in
                
                // Update the UI in the main thread
                DispatchQueue.main.async {
                    completion(error)
                }
                
            }
        }
        
        
        
    }
    
    func resetGroupDetailForm() {
        self.groupName = ""
        self.datePicked = Date()
        self.allowInvitesToGroup = false
        
    }
    
    // MARK: - Add Restaurants to Group
    func addRestaurantNameToMyGroup(groupId: String, restaurantName : String, restaurantId : String, restaurantAlias: String, completion: @escaping (Error?) -> Void) {
        // Restaurant Name is stored in firebase
        
        // Ensure user is logged in
        guard self.checkLogin() != false else {
            
            // Use is not logged in
            return
        }
        
        let suggestorId = self.getLoggedInUserId()
        
        // Create document id for adding restaurant
        
        DispatchQueue.init(label: "userAddedRestaurantToGroup").async {
            
            GroupsDataService().userAddedRestauranttoGroup(groupId: groupId, restaurantAlias: restaurantAlias, restaurantId: restaurantId, restaurantName: restaurantName, suggestorId: suggestorId) { error in
                
                if error == nil {
                    
                    completion(error)
                    
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
