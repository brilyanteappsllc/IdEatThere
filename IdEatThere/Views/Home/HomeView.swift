//
//  HomeView.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var isMapShowing = false
    @State var selectedBusiness: Business?
    
    @EnvironmentObject var model: ContentModel
    
    @State var tabSelection = 0
    
    // --- UI Tab Bar Color ---
    init() {
        
        // Setting Standard appearance when content is scrolled under the tab bar
        ColorTheme().tabBarAppearance(appearance: "Standard")
        
        // Setting apperance when content is no longer under the tab bar
        Color.theme.tabBarAppearance(appearance: "ScrollEdge")

        
    }
    
    var body: some View {
        
        ZStack {
            
            Color.theme.background
                .ignoresSafeArea()
            
            TabView{
                // --- Home View ---
                MapView()
                    .tabItem{
                        VStack{
                            Image(systemName: "mappin.and.ellipse")
                            Text("Map")
                        }
                    }
                    
                
                // --- Community View ----
                MyGroupsView()
                    .tabItem {
                        VStack{
                            Image(systemName: "person.3")
                            Text("My Groups")
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
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
