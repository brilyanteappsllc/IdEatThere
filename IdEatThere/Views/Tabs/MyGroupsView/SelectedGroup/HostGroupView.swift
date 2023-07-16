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
        
        
        let array = myGroupsModel.groupsRestaurantsList
        
        
        VStack(alignment: .leading) {
            
            Form {
                
                Section(header: Text("Group Name")) {
                    HStack {
                        Text(groups.groupName ?? "No name yet")
                        Spacer()
                        Button {
                            
                        } label: {
                            
                            HStack {
                                Image(systemName: "pencil.circle")
                            }
                            
                            
                        }
                       
                        
                    }
                }
                
                //   Text("GroupId: \(groups.id ?? "")")
                //     Text("GroupName: \(groups.groupName ?? "")")
                
                
                Section(header: Text("Table for: ")) {
                    HStack {
                        
                        Text("\(groups.attendees?.count ?? 0)")
                        
                        
                        Spacer()
                        Button {
                            
                        } label: {
                            
                            HStack {
                                Image(systemName: "person.fill.questionmark")
                            }
                            
                            
                        }
                    }
                }
                
                Section(header: Text("Date Picked:")) {
                    
                    HStack {
                        
                        Text(groups.date ?? Date(), formatter: myGroupsModel.dateFormatter)
                        Spacer()
                        Button {
                            
                            // TESTING DATES
//                            let datetoString = DateConverter().formatDateToString(date: groups.date ?? Date())
//                            let testDate = DateConverter().formattedDateFromString(dateString: datetoString ?? "", withFormat: "yyyy-mm-dd")
//
//                            print("Date To String = \(datetoString)")
//                            print("TEST DATE = \(testDate as Any)")
                            
                        } label: {
                            
                            HStack {
                                Image(systemName: "pencil.circle")
                            }
                            
                            
                        }
                       
                    }
                }
                //                HStack {
                //
                //                    Text(groups.date ?? Date(), formatter: myGroupsModel.dateFormatter)
                //
                //                    Button {
                //
                //                    } label: {
                //
                //                        HStack {
                //                            Text("Edit")
                //                            Image(systemName: "pencil.circle")
                //                        }
                //
                //
                //                    }
                //                    .shadow(radius: 1)
                //                    .cornerRadius(10)
                //
                //
                //
                //                }
                
                
                //                if myGroupsModel.groupsRestaurantsList.isEmpty {
                //                    Text("No Restaurants have been added yet.")
                //
                //                }
                //                else {
                
                
                
                Section(header: Text("Restaurants"), footer: Text("\(array.count) \(array.count > 1 ? "restaurants" : "restaurant")")) {
                    
                    NavigationLink {
                        MapView(groups: groups)
                        
                    } label: {
                        Image(systemName: "map")
                    }
                        
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
                
                
                //        }
                
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
