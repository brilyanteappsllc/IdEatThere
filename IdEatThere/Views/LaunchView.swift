//
//  ContentView.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI
import CoreLocation

struct LaunchView: View {
    
    @EnvironmentObject var model : ContentModel
    @EnvironmentObject var userManager : UserManager
    
    var body: some View {
        
        // MARK: - Authorization Status, Geolocating User -
        
        // Not determined
        if model.authorizationState == .notDetermined  {
        
            // - Onboarding View -
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
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
