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
        
        if userManager.newUser {
            
            OnboardingView()
            
        }
        
        else if userManager.loggedIn == false {
            
                LoginForm()
            
        }
        
        else {
            HomeView()
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
