//
//  AddingToMyGroupsView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 2/23/23.
//

import SwiftUI

struct AddingToMyGroupsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var showMyGroupsView : Bool
    
    @EnvironmentObject var myGroupsModel : MyGroupsModel
    
    var business : Business
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                // MARK: - Hosting List
                Text("Hosting")
                    .padding(.top, 25)
                    .padding(.leading)
                
                
                AddingToMyGroupsListView(groups: myGroupsModel.groupsHosting, business: business)
                
                
                // MARK: - Attending List
                
                Text("Attending")
                    .padding(.top, 25)
                    .padding(.leading)
                
                AddingToMyGroupsListView(groups: myGroupsModel.groupsAttending, business: business)
                
            }
            .onAppear{
                myGroupsModel.queryGroupsHosting()
                myGroupsModel.queryGroupsAttending()
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Text("My Groups")
                            .font(.system(size: 30))
                            .font(Font.headingFont)
                        Spacer()
                        Button {
                            self.showMyGroupsView = false
                        } label: {
                            Text("Done")
                                .bold()
                        }

                    }
                    .padding(.top, 10)
                }
            }
        }
    }
}

//struct AddingToMyGroupsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddingToMyGroupsView()
//    }
//}
