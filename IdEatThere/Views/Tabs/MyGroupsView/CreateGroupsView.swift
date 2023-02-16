//
//  CreateGroupsView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/9/23.
//

import SwiftUI

struct CreateGroupsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var contactsModel : ContactsModel
    
    @Binding var hasGroups : Bool
    
    var body: some View {
        
        VStack {
            
            ContactsListView(filterText: $contactsModel.filterText)
            

            
            Spacer()
            
        }
        .padding(.horizontal)
        .onAppear{
            contactsModel.getLocalContacs()
        }
    }

        
    

}

struct CreateGroupsView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGroupsView(hasGroups: .constant(false))
            .environmentObject(MyGroupsModel())
            .environmentObject(ContactsModel())
    }
}
