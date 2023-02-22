//
//  LaunchViewModel.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 2/22/23.
//

import Foundation



class LaunchViewModel : ObservableObject {
    
    @Published var loadingLogginStatus : Bool
    @Published var isUserLoggedIn : Bool
    
    init() {
        self.loadingLogginStatus = true
        self.isUserLoggedIn = false
        self.getLoggedInStatus()
        
    }
    
    
    func getLoggedInStatus() {
        
        
        DispatchQueue.init(label: "loggedInStatus").async {
            
            UserManagerModel().appLaunch_listener() {status in
                
                
                DispatchQueue.main.async {
                    self.isUserLoggedIn = status
                    print("loggedinStatus: \(self.isUserLoggedIn)")
                    
                    if status != nil {
                        
                        self.loadingLogginStatus = false
                        
                    }
                    
                }
                
                
            }
            
            
        }
    }
    
    
    
}
