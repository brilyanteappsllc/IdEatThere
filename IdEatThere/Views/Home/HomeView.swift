//
//  HomeView.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

enum Tab : Int {
    
    case Groups = 0
    case Map = 1
    case Profile = 2
    
}

struct HomeView: View {
    

    @State var tabSelection : Tab = .Groups
    

    
    var body: some View {
        
        ZStack {
            
            TabView(selection: $tabSelection) {
                // --- Community View ----
                MyGroupsView()
                    .tabItem {
                        VStack{
                            Image(systemName: "person.3")
                            Text("My Groups")
                        }
                    }
                    .tag(Tab.Groups)
                
                // --- Home View ---
                MapView()
                    .tabItem{
                        VStack{
                            Image(systemName: "fork.knife")
                            Text("I'd Eat That")
                        }
                    }
                    .tag(Tab.Map)
                    
                
                
                
                // --- My Profile View ---
                MyProfileView()
                    .tabItem {
                        VStack{
                            Image(systemName: "person.circle")
                            Text("My Profile")
                        }
                    }
                    .tag(Tab.Profile)
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
