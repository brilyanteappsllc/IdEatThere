//
//  CreateGroupsView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/9/23.
//

import SwiftUI

struct CreateGroupsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var myGroupsModel : MyGroupsModel
    @EnvironmentObject var myContactsModel : ContactsModel
    
    @Binding var hasGroups : Bool
    
    var body: some View {
        
        VStack {
            
            HStack {
                VStack {
                    Text("Create a Group!")
                    Text("Select contacts you'd like to invite")
                }
            }
            
            Button {
                
                self.hasGroups = true
                dismiss()
                dismiss.callAsFunction()
            } label: {
                Text("Create")
            }
            
            ContactsListView(searchedContact: $myContactsModel.searchedContact)
            

            
            Spacer()
            
        }
        .padding(.horizontal)    }
}

//struct CreateGroupsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateGroupsView()
//    }
//}
