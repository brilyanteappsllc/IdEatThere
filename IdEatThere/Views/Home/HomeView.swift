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
    
    var body: some View {
        
        ZStack {
            
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
