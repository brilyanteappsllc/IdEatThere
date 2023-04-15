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
    
//    init() {
//        FirebaseApp.configure()
//        UserManagerModel().appLaunch_listener()
//    }
    
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(RestaurantsContentModel())
                .environmentObject(UserManagerModel())
//                .environmentObject(RestaurantDataService())
                .environmentObject(UserLocationService())
                .environmentObject(MyGroupsModel())
                .environmentObject(ContactsModel())
                .environmentObject(LaunchViewModel())
                .environmentObject(UserHostDetailsModel())
            
        }
    }
}
