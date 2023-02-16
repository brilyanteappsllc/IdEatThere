//
//  ContactsModel.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/12/23.
//

import Foundation
import Contacts

class ContactsModel : ObservableObject {
    
   private var users = [User]()
    
    @Published var filterText = ""
    @Published var filteredUsers = [User]()
    
    private var localContacts = [CNContact]()
    
    @Published var searchedContact : String = ""
    
    
    func getLocalContacs() {
        
        DispatchQueue.init(label: "getcontacts").async {
            
            do {
                
                // Ask for permission
                let store = CNContactStore()
                
                
                // List of keys we want to get
                let keys = [CNContactPhoneNumbersKey,
                            CNContactGivenNameKey,
                            CNContactFamilyNameKey] as [CNKeyDescriptor]
                
                // Create a CNFetchRequest
                let fetchRequest = CNContactFetchRequest(keysToFetch: keys)
                
                // Get the contacts on the user's phone
                try store.enumerateContacts(with: fetchRequest, usingBlock: { contact, success in
                    
                    // Do something with the contact
                    self.localContacts.append(contact)
                    
                    
                })
                
                UserManagerModel().getPlatformUsers(localContacts: self.localContacts) { platformUsers in
                    
                    // Update the UI in the main thread
                    DispatchQueue.main.async {
                        
                        // Set the fetched users to the published users property
                        self.users = platformUsers
                        
                        self.filterContacts(filterBy: self.filterText)
                        
                        
                        
                    }
                
                    
                    
                }
                
                
            }
            catch {
                print(error)
                
            }
            
        }
    }
    
    func filterContacts(filterBy: String) {
        
        // store parameter into property
        self.filterText = filterBy
        
        // If Filter text is empty, then reveal all users
        if filterText.isEmpty {
            self.filteredUsers = users
            return
        }
        
        // Run the users list through tht filter term to get a list of filtered users
        self.filteredUsers = users.filter({ user in
            // Criteria for including this user into fiiltered users list
            user.firstName?.lowercased().contains(filterText) ?? false ||
            user.lastName?.lowercased().contains(filterText) ?? false ||
            user.phone?.lowercased().contains(filterText) ?? false
        })
        
        print(self.filteredUsers)
        
    }
}
