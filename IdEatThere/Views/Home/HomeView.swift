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
    
    @EnvironmentObject var userManagerModel : UserManagerModel
    @EnvironmentObject var myGroupsModel : MyGroupsModel
    @EnvironmentObject var calenderModel : CalendarEventStoreViewModel
    @State var tabSelection : Tab = .Groups
    

    
    var body: some View {
        
        if userManagerModel.newUser {
            VStack {
                    CreateProfileView()

                        Button {
                            userManagerModel.setUserProfile(firstName: userManagerModel.firstName, lastName: userManagerModel.lastName, photo: userManagerModel.photo) { isSuccess in
                                
                                if isSuccess {
                                    self.userManagerModel.finishedProfile()
                                    
                                }
                                
                                else {
                                    
                                    // Show warning error
                                    print(isSuccess)
                                    
                                }
                            }
                                
                            
                        } label: {
                            ZStack {
                            Rectangle()
                                .foregroundColor(Color.theme.red)
                                .frame(height: 48)
                                .cornerRadius(20)
                                .padding(.horizontal)
                            
                            Text("Save")
                        }
                            .padding(.bottom)

 
                    }

                
                
            }
            
        }
        
        else {
            
            ZStack {
                
                TabView(selection: $tabSelection) {
                    // --- Community View ----
                    MyGroupsView()
                        .tabItem {
                            VStack{
                                Image(systemName: "house")
                                Text("Home")
                            }
                        }
                        .tag(Tab.Groups)
                        .onAppear{
                            myGroupsModel.queryGroupsAttending()
                            myGroupsModel.queryGroupsHosting()
                            calenderModel.queryCalendarEvents()
                        }
                    
                    // --- Home View ---
                    MapView()
                        .tabItem{
                            VStack{
                                Image(systemName: "fork.knife")
                                Text("Restaurants")
                            }
                        }
                        .tag(Tab.Map)
                    
                    
                    
                    
                    // --- My Profile View ---
                    MyProfileView()
                        .tabItem {
                            VStack{
                                Image(systemName: "person.fill")
                                Text("Profile")
                            }
                        }
                        .tag(Tab.Profile)
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
