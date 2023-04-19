//
//  GroupsListView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/17/23.
//

import SwiftUI

struct GroupsListView: View {
    
    var groups : [Groups]
    
    
    var body: some View {
        
        
        ScrollView(showsIndicators: false) {
            
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
            
            LazyVStack(alignment: .leading) {
                ForEach(groups, id: \.id) { groups in
                    
                    NavigationLink {
                        SelectedGroupView(groups: groups)
                        
                    } label: {
                        GridButton(group: groups)
                    }
                }
            }
            .padding(.vertical, 10)

        }
        .padding(.vertical, -10)
        .padding(.horizontal)

    }
}

//struct GroupsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupsListView()
//    }
//}
