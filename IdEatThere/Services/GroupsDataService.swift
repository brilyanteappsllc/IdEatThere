//
//  GroupsDataService.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/9/23.
//

import Foundation


import Firebase
import FirebaseFirestore

class GroupsDataService {
    
    let db = Firestore.firestore()
    
    func userCreatesGroup(userId: String, groupName: String, groupType: String, groupPhoto: UIImage?, datePicked: Date, allowInvites: Bool, completion: @escaping (Error?) -> Void) {
        
        // Set document id
        let userDocumentId = userId
        
        // Create subcollection (if not already existing) for active groups
        let subCollectionPath = db.collection("users").document(userDocumentId).collection("calendar")
        
        // Create path to subcollection with autoGeneratedId document
        let autoIdDocumentPath = subCollectionPath.document()
        
        // Set the new GroupId as the autoGeneratedID document
        let groupId = autoIdDocumentPath.documentID
        
        // Make sure to the new documentid (same as groupid) in the subcollection with a timestamp field
        let calendarDocPath = subCollectionPath.document(groupId)
        
        // Set information in user active groups, this will be used for calendar events to display
        calendarDocPath.setData(["groupName" : groupName,
                                 "groupType" : groupType,
                                 "date": Timestamp(date: datePicked),
                                ]) { [self] (error) in
            
            if let error = error {
                completion(error)
            }
            
            else {
                
                //If there is no error setting the groups doc path, then create new group
                
                // Create the new group path collection with user's filled out fields from the create groups form
                
                let groupPath = db.collection("groups").document(groupId)
                
                // TODO: Add uploading image option (convert to url string) (reference userManager)
                groupPath.setData(["groupName" : groupName,
                                   "groupType" : groupType,
                                   "attendees" : FieldValue.arrayUnion([""]),
                                   "host" : FieldValue.arrayUnion(["\(userId)"]),
                                   "date" : Timestamp(date: datePicked),
                                   "allowInvites" : allowInvites]) { (error) in
                    
                    if let error = error {
                        
                        
                        completion(error)
                    }
                    
                    else {
                        completion(error)
                    }
                }
            }
        }
    }
    
    func userGroupsAttending(userId: String, completion: @escaping ([Groups]) -> Void) {
        
        var groupsAttending = [Groups]()
        
        let attendee = userId
        
        let fieldlookup = Array(attendee)
        
        let query = db.collection("groups").whereField("attendees", arrayContains: attendee)
        
        query.getDocuments { snapshot, error in
            
            // Check if errors
            if error == nil && snapshot != nil {
                
                // For each doc the was fetched, append to groupsArray
                
                for doc in snapshot!.documents {
                    
                    if let groups = try? doc.data(as: Groups.self) {
                        
                        groupsAttending.append(groups)
                    }
                }
                
                completion(groupsAttending)
            }
            else {
                print(error)
            }
            
        }
        
    }
    
    func userGroupsHosting(userId: String, completion: @escaping ([Groups]) -> Void) {
        
        let host = userId
        var groupsHosting = [Groups]()
        let fieldlookup = Array(host)
        
        let query = db.collection("groups").whereField("host", arrayContains: host)
        
        query.getDocuments { snapshot, error in
            
            // Check if errors
            if error == nil && snapshot != nil {
                
                // For each doc the was fetched, append to groupsArray
                
                for doc in snapshot!.documents {
                    
                    if let groups = try? doc.data(as: Groups.self) {
                        
                        groupsHosting.append(groups)
                        print(groups.date)
                    }
                }
                
                completion(groupsHosting)
            }
            
        }
        
    }
    
    func userAddedRestauranttoGroup(groupId: String, restaurantAlias: String, restaurantId: String, restaurantName: String, suggestorId: String, completion: @escaping (Error?) -> Void) {
        
        let selectedGroupId = groupId
        
        
        // Get reference to the database
        let restaurantListPath = db.collection("groups").document(groupId).collection("restaurantsList")
        
        
        // Set document Id
        let restaurantDoc = restaurantListPath.document()
        
        // Set the data
        
        restaurantDoc.setData(["restaurantAlias" : restaurantAlias,
                               "restaurantId" : restaurantId,
                               "restaurantName" : restaurantName,
                               "suggestorId" : suggestorId]) { (error) in
            
            if let error = error {
                
                
                completion(error)
            }
            
            else {
                completion(error)
            }
            
            
        }
        
        
    }
    
    func userCalendarEvents(userId: String, completion: @escaping ([CalendarEvents]) -> Void) {
        
        var userCalendarEvents = [CalendarEvents]()
        
        let query = db.collection("users").document(userId).collection("calendar")
        
        query.getDocuments { snapshot, error in
            // Check if errors
            if error == nil && snapshot != nil {
                
                // For each doc the was fetched, append to Calendar array
                
                for doc in snapshot!.documents {
                    
                    if let events = try? doc.data(as: CalendarEvents.self) {
                        
                        userCalendarEvents.append(events)
                        
                    }
                }
                
                completion(userCalendarEvents)
            }
            
        }
        
        
    }
    
    
    
}
