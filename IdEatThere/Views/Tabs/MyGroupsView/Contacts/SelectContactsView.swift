//
//  SelectContactsView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 2/24/23.
//

import SwiftUI

struct SelectContactsView: View {
    
    @EnvironmentObject var contactsModel : ContactsModel
    
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

struct SelectContactsView_Previews: PreviewProvider {
    static var previews: some View {
        SelectContactsView()
            .environmentObject(ContactsModel())
    }
}
