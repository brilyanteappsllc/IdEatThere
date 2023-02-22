//
//  ContactsListView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/17/23.
//

import SwiftUI


struct ContactsListView: View {
    
    @EnvironmentObject var myContactModel : ContactsModel
    
    @Binding var filterText : String
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
                
                TextField("Search Contacts...", text: $filterText)
                    .foregroundColor(Color.theme.accent)
                
                Button {
                    self.filterText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                }

                
            }
            .onChange(of: filterText) { _ in
                // Filter the results
                myContactModel.filterContacts(filterBy: filterText.lowercased())
            }
            
            
            // List
            
            if myContactModel.filteredUsers.count > 0 {
                List(myContactModel.filteredUsers) { user in
                    
                    ContactsRow(user: user)
                    
                }
                .listStyle(.plain)
            }
        }
        .alert(hostAlert_SelectContactsTitle, isPresented: $presentHostAlert, actions: {})
        
        
    }
}

struct ContactsListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsListView(filterText: .constant(""))
    }
}