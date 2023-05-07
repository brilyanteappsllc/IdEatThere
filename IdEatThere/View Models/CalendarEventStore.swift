//
//  CalendarEventStore.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 4/21/23.
//

import Foundation
import Combine
import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseStorage


@MainActor

class CalendarEventStoreViewModel : ObservableObject {
    
    @Published var eventType : CalendarEventType = .unspecified
    
    @Published var calendarEvents = [CalendarEvents]()
    
    
    private var userId = ""
    
    
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
    
    // MARK: Calendar Query
    func queryCalendarEvents() {
        
        // Ensure user is logged in
        guard self.checkLogin() != false else {
            
            // Use is not logged in
            return
        }
        
        let userId = self.getLoggedInUserId()
        
        
        DispatchQueue.init(label: "getUserCalendarEvents").async {
            
            GroupsDataService().userCalendarEvents(userId: userId) { calenderEvents in
                
                DispatchQueue.main.async {
                    self.calendarEvents =  calenderEvents
                    print(self.calendarEvents)
                }
            }
            
            
        }
    }
    
    func eventIcon(groupType: CalendarEventType) -> String {
        
        return groupType.icon
        
        
    }
    
    
}
