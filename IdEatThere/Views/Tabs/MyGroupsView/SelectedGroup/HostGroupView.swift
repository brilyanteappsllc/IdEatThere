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
        
        VStack(alignment: .leading, spacing: 5) {
            
            Group {
        
                Text("Hosting")
                
                //   Text("GroupId: \(groups.id ?? "")")
                //     Text("GroupName: \(groups.groupName ?? "")")
                
                
                if groups.attendees?.count ?? 0 > 0 {
                    
                    Text("Table for \(groups.attendees?.count ?? 0)")
                  
                }
                
                
                HStack {
                    
                    Text(groups.date ?? Date(), formatter: myGroupsModel.dateFormatter)
                    
                    Button {
                        
                    } label: {
            
                        HStack {
                            Text("Edit")
                            Image(systemName: "pencil.circle")
                        }
                            
                        
                    }
                    .shadow(radius: 1)
                    .cornerRadius(10)
                    

                    
                }
                
                
            }
            .padding(.horizontal)
                
                if myGroupsModel.groupsRestaurantsList.isEmpty {
                    Text("No Restaurants have been added yet.")
                    
                }
                else {
                    
                    let array = myGroupsModel.groupsRestaurantsList
                    
                    List {
                        
                        ForEach(myGroupsModel.groupsRestaurantsList) {restaurant in
                            
                            NavigationLink {
                                SelectedGroupRestaurantDetailView(id: restaurant.restaurantId ?? "", complete: false)
                            } label: {
                                
                                VStack(alignment: .leading) {
                                    Text(restaurant.restaurantName ?? "")
                                    Text("\(restaurant.voteCount ?? 0) \(restaurant.voteCount ?? 0 > 1 ? "Votes" : "Vote")")
                                }
                                
                            }
                            
                            
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
