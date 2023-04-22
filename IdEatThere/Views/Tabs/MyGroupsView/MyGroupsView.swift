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
    
    private var selectedDate : Date?
    
    var body: some View {
        
        if myGroupsModel.hasGroups == true {
            
            
            NavigationView {
                
                VStack(alignment: .leading) {
                    
//                    Group {
//
//                        Text("Upcoming Events")
//                            .font(.bodyHeaderFont)
//                            .padding(.leading)
//                            .padding(.top, 10)
//                    }
                    
                    
                    if #available(iOS 16.0, *) {
                        CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture))
                    } else {
                        // Fallback on earlier versions
                    }
                    
                    ZStack(alignment: .bottom) {
                        
                        DashedDivider()
                        
                        AllHostAttendBarView(groupTabSelection: $groupTabSelection)
                          //  .padding(.top, 10)
                        
                        
                        
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                    
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
 //               .navigationTitle("My Groups")
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
                            Image(systemName: "calendar.badge.plus")
                        }
                        .font(.bodyHeaderFont)
                        .padding(.top, 10)
                        
                    }
                    
                }
                .safeAreaInset(edge: .bottom) {
                    Rectangle()
                        .fill(LinearGradient(colors: [.white, .white.opacity(0)], startPoint: .bottom, endPoint: .top))
                        .frame(height: 90)
                        .padding(.bottom, 50)
                }
                .edgesIgnoringSafeArea(.bottom)
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

struct MyGroupsView_Previews: PreviewProvider {
    static var previews: some View {
        MyGroupsView()
            .environmentObject(MyGroupsModel())
    }
}
