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
    @EnvironmentObject var contactsModel : ContactsModel
    
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
            
            ContactsListView(searchedContact: $contactsModel.searchedContact)
            

            
            Spacer()
            
        }
        .padding(.horizontal)
        .onAppear{
            contactsModel.getLocalContacs()
        }
    }

        
    

}

//struct CreateGroupsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateGroupsView()
//    }
//}
