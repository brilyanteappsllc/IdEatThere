//
//  HostSelectedGroupView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 5/7/23.
//

import SwiftUI

struct HostGroupView: View {
    
    @EnvironmentObject var myGroupsModel : MyGroupsModel
    @EnvironmentObject var userHostDetails : UserHostDetailsModel
    
    var groups : Groups
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            
            Group {
        
                Text("Your are the host!")
                
                //   Text("GroupId: \(groups.id ?? "")")
                //     Text("GroupName: \(groups.groupName ?? "")")
                
                Text(groups.date ?? Date(), formatter: myGroupsModel.dateFormatter)
                
                
            }
                
                if myGroupsModel.groupsRestaurantsList.isEmpty {
                    Text("No Restaurants have been added yet.")
                    
                }
                else {
                    
                    ForEach(myGroupsModel.groupsRestaurantsList) { restaurant in
                        
                        NavigationLink {
                            SelectedGroupRestaurantDetailView(id: restaurant.restaurantId ?? "", complete: false)
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

//struct HostGroupView_Previews: PreviewProvider {
//    static var previews: some View {
//        HostGroupView()
//    }
//}
