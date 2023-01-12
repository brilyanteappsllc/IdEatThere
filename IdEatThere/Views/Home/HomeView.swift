//
//  HomeView.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

struct HomeView: View {
    

    @State var tabSelection = 1
    

    
    var body: some View {
        
        ZStack {
            
            TabView{
                // --- Community View ----
                MyGroupsView()
                    .tabItem {
                        VStack{
                            Image(systemName: "person.3")
                            Text("My Groups")
                        }
                    }
                
                // --- Home View ---
                MapView()
                    .tabItem{
                        VStack{
                            Image(systemName: "fork.knife")
                            Text("I'd Eat That")
                        }
                    }
                    
                
                
                
                // --- My Profile View ---
                MyProfileView()
                    .tabItem {
                        VStack{
                            Image(systemName: "person.circle")
                            Text("My Profile")
                        }
                    }
                    .tag(3)
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
