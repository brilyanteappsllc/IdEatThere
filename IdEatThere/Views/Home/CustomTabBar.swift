//
//  CustomTabBar.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/9/23.
//

import SwiftUI

enum Tabs: Int {
    
    case groups = 0
    case maps = 1
    case profile = 2
}

struct CustomTabBar: View {
    
    @Binding var tabSelection : Tabs 
    var body: some View {
        
        HStack(alignment: .center) {
            
            // -- My Groups --
            Button {
                tabSelection = .groups
            } label: {
                
                TabBarButton(
                    buttonText: "My Groups",
                    imageName: "person.3",
                    isActive: tabSelection == .groups)
                

            }
            
            // -- Eats --
            
            Button {
                tabSelection = .maps
            } label: {
                
                TabBarButton(
                    buttonText: "Eats",
                    imageName: "fork.knife",
                    isActive: tabSelection == .maps)
            }
            
            // -- My Profile --
            
            Button {
                tabSelection = .profile
            } label: {
                
                TabBarButton(
                    buttonText: "My Profile",
                    imageName: "person.circle",
                    isActive: tabSelection == .profile)
            }
                
        }
        
        
        
        
        
       
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(tabSelection: .constant(.groups))
    }
}
