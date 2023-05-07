//
//  GroupsListView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/17/23.
//

import SwiftUI

struct GroupsListView: View {
    
    var groups : [Groups]
    
    var isHost: Bool
    
    var body: some View {
        
        
        ScrollView(showsIndicators: false) {
            
            LazyVStack(alignment: .leading) {
                ForEach(groups, id: \.id) { groups in
                    
                    NavigationLink {
                        SelectedGroupView(groups: groups, viewAsHost: isHost)
                        
                    } label: {
                        GridButton(group: groups, viewAsHost: isHost)
                    }
                }
            }
            .padding(.vertical, 10)
        }
        .padding(.vertical, -10)
  //      .padding(.horizontal)

    }
}


//            let rows = GridItem(.flexible(minimum: 100, maximum: 100), spacing: 15)
//
//            LazyHGrid(rows: [rows], spacing: 15) {
//
//                ForEach(groups, id: \.id) { groups in
//
//                    NavigationLink {
//                        SelectedGroupView(groups: groups)
//
//                    } label: {
//                    GridButton(groupName: groups.groupName ?? "")
//                }
//                }
//            }

//struct GroupsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupsListView()
//    }
//}
