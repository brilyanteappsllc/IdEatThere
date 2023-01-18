//
//  ContactsListView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/17/23.
//

import SwiftUI

struct ContactsListView: View {
    
    @Binding var searchedContact : String
    
    var body: some View {
        
        VStack {
            
//            // Heading
//            HStack {
//
//                Text("Contacts")
//                    .font(.largeTitle)
//
//                Spacer()
//
//                Button {
//
//
//                } label: {
//                    Image(systemName: "gearshape.fill")
//                        .resizable()
//                        .frame(width: 20, height: 20)
//                        .tint(Color.theme.accent)
//
//                }
//            }
            
            // Search Bar
            HStack {
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.theme.blackText
                    )
                
                TextField("Search Contacts...", text: $searchedContact)
                    .foregroundColor(Color.theme.accent)
                
                Button {
                    self.searchedContact = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                }

                
            }
            
            
            // List

        }
        
        
    }
}

struct ContactsListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsListView(searchedContact: .constant(""))
    }
}
