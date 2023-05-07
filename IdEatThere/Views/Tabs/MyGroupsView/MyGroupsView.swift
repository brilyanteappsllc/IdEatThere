//
//  MyGroupsView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

struct MyGroupsView: View {
    
    
    @EnvironmentObject var myGroupsModel : MyGroupsModel
    @EnvironmentObject var calendarEventModel : CalendarEventStoreViewModel
    @EnvironmentObject var userManagerModel : UserManagerModel
    
    @State var groupTabSelection = TabsSelections.host
    @State var dateSelected : DateComponents?
    @State var displayEvents = false 
    
    
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
                        CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture), eventStore: calendarEventModel, dateSelected: $dateSelected, displayEvents: $displayEvents)
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
                        
                        GroupsListView(groups: myGroupsModel.groupsHosting, isHost: true)
                        
                    }
                    
                    if groupTabSelection == .attend {
                        
                        GroupsListView(groups: myGroupsModel.groupsAttending, isHost: false)
                        
                    }
                    Spacer()
                    
                }
                .sheet(isPresented: $presentCreateGroupView) {
                    CreateGroupsView(eventType: $calendarEventModel.eventType)
                }
                .sheet(isPresented: $displayEvents, content: {
                    if #available(iOS 16.0, *) {
                        CalendarEventSheetView(dateSelected: $dateSelected)
                            .presentationDetents([.medium, .large])
                    } else {
                        // Fallback on earlier versions
                    }
                })
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
