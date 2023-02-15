//
//  IdEatThereApp.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct IdEatThereApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(RestaurantsContentModel())
                .environmentObject(UserManagerModel())
                .environmentObject(RestaurantDataService())
                .environmentObject(MyGroupsModel())
                .environmentObject(ContactsModel())
            
        }
    }
}
