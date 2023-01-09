//
//  AppDelegate.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/9/23.
//

import Foundation
import UIKit
import Firebase


class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // --- UI Tab Bar Color ---

            // Setting Standard appearance when content is scrolled under the tab bar
            ColorTheme().tabBarAppearance(appearance: "Standard")
            
            // Setting apperance when content is no longer under the tab bar
            ColorTheme().tabBarAppearance(appearance: "ScrollEdge")

        
        
        FirebaseApp.configure()
        

        return true
    }
    
    
    
}
