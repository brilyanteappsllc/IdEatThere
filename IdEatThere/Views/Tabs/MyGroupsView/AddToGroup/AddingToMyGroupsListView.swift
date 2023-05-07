//
//  AddingToMyGroupsListView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 3/5/23.
//

import SwiftUI

struct AddingToMyGroupsListView: View {
    
    var groups : [Groups]
    
    var business : Business
    
    @EnvironmentObject var myGroupsModel : MyGroupsModel
    
    var body: some View {
        
        
        ScrollView(.horizontal) {
            
            let rows = GridItem(.flexible(minimum: 100, maximum: 100), spacing: 15)
            
            LazyHGrid(rows: [rows], spacing: 15) {
                
                ForEach(groups, id: \.id) { groups in
                    
                    Button {
                        print("Adding \(String(describing: business.name)) to group \(String(describing: groups.groupName))")
                        
                        myGroupsModel.addRestaurantNameToMyGroup(groupId: groups.id ?? "", restaurantName: business.name ?? "", restaurantId: business.id ?? "", restaurantAlias: business.alias ?? "") { error in
                            
                            
                            
                        }
                        
                    } label: {
                    GridButton(group: groups, viewAsHost: false)
                }
                }
            }

        }
        .padding(.horizontal)
        
    }
    
    
    
}

