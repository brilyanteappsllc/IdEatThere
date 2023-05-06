//
//  ContentView.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI
import CoreLocation


struct LaunchView: View {
    
    
    @EnvironmentObject var launchViewModel : LaunchViewModel
    @EnvironmentObject var userManagerModel : UserManagerModel
    
    
    var body: some View {
        
        if self.launchViewModel.loadingLogginStatus {
            
            ProgressView()
        }
        
        else {

            if self.userManagerModel.completedOnboarding{

                HomeView()
                
            }
            
            else if !self.launchViewModel.isUserLoggedIn {
                
               SplashScreen()
                
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
