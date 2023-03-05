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
        
        
        NavigationView {
            
            VStack {
                Text("Your Host: \(userHostDetails.userHostName)")
                
             //   Text("GroupId: \(groups.id ?? "")")
           //     Text("GroupName: \(groups.groupName ?? "")")
                
                List(myGroupsModel.groupsRestaurantsList) { restarant in
                    
                    Text(restarant.restaurantName ?? "")
                
                
            }
            
            .onAppear{
                
                userHostDetails.hostName(hostId: groups.host?[0] ?? "")
                myGroupsModel.queryRestaurantsInGroups(groupsId: groups.id ?? "")
                    
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        //TODO: Add image for the group
//                        Image(systemName: "fork.knife.circle.fill")
//                            .font(.system(size: 25))
                        Text(groups.groupName ?? "")
                            .font(.system(size: 30))
                            .font(Font.headingFont)
                    }
                    .padding(.top, 10)
                }
                
                
            }
        }
        
    }
}

//struct SelectedGroupView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectedGroupView()
//    }
//}
