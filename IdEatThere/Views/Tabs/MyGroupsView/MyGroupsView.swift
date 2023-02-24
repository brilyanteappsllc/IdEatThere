//
//  MyGroupsView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

struct MyGroupsView: View {
    
    
    @EnvironmentObject var myGroupsModel : MyGroupsModel
    
    
    @State var presentCreateGroupView : Bool = false
    
    var body: some View {
        
        if myGroupsModel.hasGroups == true {
            
            
            NavigationView {
                    
                    VStack(alignment: .leading) {
                        
                        Text("My Groups")
                            .padding(.leading)
                            .padding(.top, 50)
                        
                        Button {
                            //                self.hasGroups = true
                            presentCreateGroupView.toggle()
                            
                        } label : {
                            
                            HostButton()
                        }
                        
                        .sheet(isPresented: $presentCreateGroupView) {
                            CreateGroupsView()
                        }
                        

                            
                    // MARK: - Hosting List
                        Text("Hosting")
                                .padding(.top, 25)
                                .padding(.leading)
                            
                        
                        GroupsListView(groups: myGroupsModel.groupsHosting)
                        
                        
                    // MARK: - Attending List
                        
                        Text("Attending")
                            .padding(.top, 25)
                            .padding(.leading)
                        
                        GroupsListView(groups: myGroupsModel.groupsAttending)
                        
                        Spacer()
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        
                        ToolbarItem(placement: .navigationBarLeading) {
                            HStack {
                                Image(systemName: "fork.knife.circle.fill")
                                    .font(.system(size: 25))
                                Text("I'd Eat There")
                                    .font(.system(size: 30))
                                    .font(Font.headingFont)
                            }
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
