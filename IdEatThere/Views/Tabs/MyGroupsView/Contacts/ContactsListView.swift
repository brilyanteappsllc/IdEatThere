//
//  ContactsListView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/17/23.
//

import SwiftUI


struct ContactsListView: View {
    
    @EnvironmentObject var myContactModel : ContactsModel
    
    @Binding var searchedContact : String
    @State var presentHostAlert = false
    @State var selectedAtLeastOneContact = false
    let hostAlert_SelectContactsTitle = "Please selected at least one contact"
    
    var body: some View {
        
        VStack {
            
            // Heading
            HStack() {

                Text("Contacts")
                    .font(.largeTitle)

                Spacer()

                HostSelectedContactsButton()
                    .onTapGesture {
                        if !self.selectedAtLeastOneContact {
                            self.presentHostAlert.toggle()
                        }
                    }
                    .padding(.top, 10)
                
            }
            
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
            List(myContactModel.users) { user in
                
                ContactsRow(user: user)
                
            }
            .listStyle(.plain)

        }
        .alert(hostAlert_SelectContactsTitle, isPresented: $presentHostAlert, actions: {})
        
        
    }
}

struct ContactsListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsListView(searchedContact: .constant(""))
    }
}
