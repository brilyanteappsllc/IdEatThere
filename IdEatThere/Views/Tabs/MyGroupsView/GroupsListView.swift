//
//  GroupsListView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/17/23.
//

import SwiftUI

struct GroupsListView: View {
    
    var groups : Groups
    
//    private var flexiblecolumns = Array(repeating: GridItem(.flexible(minimum: 0),
//                                                    spacing: 15,
//                                                    alignment: .center), count: 3)
    var body: some View {
        
       // GeometryReader { geomety in
        
            
//            LazyVGrid(columns: Array(repeating: GridItem(.flexible(minimum: 0),
//                                                         spacing: 15,
//                                                         alignment: .center), count: 3)) {
        
             //   ForEach(groups) {group in
                    
                  //  GridButton(groupName: group.groupName! )

        Text(groups.groupName ?? "")
            .foregroundColor(Color.theme.accent)
           // }
   //     }
        .padding(.horizontal)
    }
    
}

//struct GroupsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupsListView()
//    }
//}
