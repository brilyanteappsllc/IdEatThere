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
    
    var business : Business
    
    
    var body: some View {
        
        VStack {
            
            Text("My Groups")
            
            // MARK: - Hosting List
                Text("Hosting")
                        .padding(.top, 25)
                        .padding(.leading)
                    
                
            AddingToMyGroupsListView(groups: myGroupsModel.groupsHosting, business: business)
                
                
            // MARK: - Attending List
                
                Text("Attending")
                    .padding(.top, 25)
                    .padding(.leading)
                
               AddingToMyGroupsListView(groups: myGroupsModel.groupsAttending, business: business)
            
        }
        .onAppear{
            myGroupsModel.queryGroupsHosting()
            myGroupsModel.queryGroupsAttending()
        }
    }
}

//struct AddingToMyGroupsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddingToMyGroupsView()
//    }
//}
