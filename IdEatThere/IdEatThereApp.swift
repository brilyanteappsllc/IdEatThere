//
//  IdEatThereApp.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI
import Firebase

@main
struct IdEatThereApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
                .environmentObject(UserManager())
        }
    }
}
