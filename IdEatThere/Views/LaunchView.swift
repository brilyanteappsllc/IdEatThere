//
//  ContentView.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI
import CoreLocation

struct LaunchView: View {
    
    @EnvironmentObject var model : RestaurantsContentModel
    @EnvironmentObject var userManager : UserManagerModel
    
    var body: some View {
        
        // MARK: - Authorization Status, Geolocating User -
        
        if userManager.loggedIn == false {
            
            if userManager.newUser || !userManager.completedOnboarding {
                
                if model.authorizationState == CLAuthorizationStatus.notDetermined {
                    
                    OnboardingView()
                }
                
                // Approved Permission
                else if model.authorizationState == CLAuthorizationStatus.authorizedAlways ||
                            model.authorizationState == CLAuthorizationStatus.authorizedWhenInUse {
                    
                    // - Home View -
                    HomeView()
                    
                }
                // Denied permission
                else {
                    
                    // - Denied View -
                    LocationDeniedView()
                    
                }
                
            }
            
            else {
                
                LoginForm()
                
            }
        }
        
        else {
            
            if userManager.loggedIn {
                
                // Approved Permission
                if model.authorizationState == CLAuthorizationStatus.authorizedAlways ||
                         model.authorizationState == CLAuthorizationStatus.authorizedWhenInUse {
                    
                    // - Home View -
                    HomeView()
                    
                }
                // Denied permission
                else {
                    
                    // - Denied View -
                    LocationDeniedView()
                    
                }
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
