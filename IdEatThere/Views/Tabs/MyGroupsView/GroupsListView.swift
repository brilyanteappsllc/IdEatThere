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
        
        
        ScrollView(.horizontal) {
            
            let rows = GridItem(.flexible(minimum: 100, maximum: 100), spacing: 15)
            
            LazyHGrid(rows: [rows], spacing: 15) {
                
                ForEach(groups, id: \.id) { groups in
                    
                    GridButton(groupName: groups.groupName ?? "")
                    
                }
            }

        }
        .padding(.horizontal)

    }
}

//struct GroupsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupsListView()
//    }
//}
