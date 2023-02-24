//
//  SelectedGroupView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 2/16/23.
//

import SwiftUI

struct SelectedGroupView: View {
    
    @EnvironmentObject var myGroupsModel : MyGroupsModel
    @EnvironmentObject var userHostDetails : UserHostDetailsModel
    
    var groups : Groups
    
    var body: some View {
        
        let host = myGroupsModel.groupsHostDetails
        
        VStack {
            Text("GroupId: \(groups.id ?? "")")
            Text("GroupName: \(groups.groupName ?? "")")
            Text("GroupHost: \(userHostDetails.userHostName)")
        }
        
        .onAppear{
            
            userHostDetails.hostName(hostId: groups.host?[0] ?? "")
            
        }
        
        
    }
}

//struct SelectedGroupView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectedGroupView()
//    }
//}
