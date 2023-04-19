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
        
   
            
        VStack(alignment: .leading) {
            
            Group {
        
                Text("Your Host: \(userHostDetails.userHostName)")
                
                //   Text("GroupId: \(groups.id ?? "")")
                //     Text("GroupName: \(groups.groupName ?? "")")
                
                
                
            }
                
                if myGroupsModel.groupsRestaurantsList.isEmpty {
                    Text("No Restaurants have been added yet.")
                    
                }
                else {
                    
                    ForEach(myGroupsModel.groupsRestaurantsList) { restaurant in
                        
                        NavigationLink {
                            SelectedGroupRestaurantDetailView(id: restaurant.restaurantId ?? "")
                        } label: {
                            
                            Text(restaurant.restaurantName ?? "")
                            
                        }
                        
                        
                    }
                    
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                ToolbarItem(placement: .principal) {
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
            .onAppear{
                
                userHostDetails.hostName(hostId: groups.host?[0] ?? "")
                myGroupsModel.queryRestaurantsInGroups(groupsId: groups.id ?? "")
                    
                }
        
    }
}

//struct SelectedGroupView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectedGroupView(groups: Groups())
//            .environmentObject(MyGroupsModel())
//            .environmentObject(UserHostDetailsModel())
//    }
//}
