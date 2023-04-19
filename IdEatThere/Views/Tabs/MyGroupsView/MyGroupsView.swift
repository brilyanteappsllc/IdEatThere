//
//  MyGroupsView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

struct MyGroupsView: View {
    
    
    @EnvironmentObject var myGroupsModel : MyGroupsModel
    
    @State var groupTabSelection = TabsSelections.host
    
    
    @State var presentCreateGroupView : Bool = false
    
    var body: some View {
        
        if myGroupsModel.hasGroups == true {
            
            
            NavigationView {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Group {
                        
                        Text("Upcoming Events")
                            .font(.bodyHeaderFont)
                            .padding(.leading)
                            .padding(.top, 50)
                    }
                    
                    
                    HostButton()
                    
                    AllHostAttendBarView(groupTabSelection: $groupTabSelection)
                        .padding(.top, 10)
                    
                    if groupTabSelection == .host {
                        
                        GroupsListView(groups: myGroupsModel.groupsHosting)
                        
                    }
                    
                    if groupTabSelection == .attend {
                        
                        GroupsListView(groups: myGroupsModel.groupsAttending)
                        
                    }
                    Spacer()
                    
                }
                .sheet(isPresented: $presentCreateGroupView) {
                    CreateGroupsView()
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("My Groups")
                            .font(.system(size: 30))
                            .font(Font.headingFont)
                            .padding(.top, 10)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        Button {
                            presentCreateGroupView.toggle()
                        } label: {
                            Image(systemName: "plus.circle")
                        }
                        .font(.headingFont)
                        .padding(.top, 10)
                        
                    }
                }
            }
        }
        
        else {
            
            ZStack {
                
                NavigationView {
                    
                    
                    NoGroupsYet(myGroupsModel: myGroupsModel)
                    
                        .navigationTitle("")
                    //      .font(Font.headingFont)
                    //  .foregroundColor(Color.theme.accent)
                }
            }
        }
    }
}

//struct MyGroupsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyGroupsView()
//            .environmentObject(MyGroupsModel())
//    }
//}
