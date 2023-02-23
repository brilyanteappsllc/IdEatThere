//
//  AddingToMyGroupsView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 2/23/23.
//

import SwiftUI

struct AddingToMyGroupsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var myGroupsModel : MyGroupsModel
    
    
    var body: some View {
        
        VStack {
            
            Text("My Groups")
            
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
            
        }
        .onAppear{
            myGroupsModel.queryGroupsHosting()
            myGroupsModel.queryGroupsAttending()
        }
    }
}

struct AddingToMyGroupsView_Previews: PreviewProvider {
    static var previews: some View {
        AddingToMyGroupsView()
    }
}
