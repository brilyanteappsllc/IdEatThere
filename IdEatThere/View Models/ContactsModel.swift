//
//  ContactsModel.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/12/23.
//

import Foundation
import Contacts

class ContactsModel : ObservableObject {
    
    @Published var users = [User]()
    
    private var localContacts = [CNContact]()
    
    
    
    
    
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
                        
                        
                    }
                
                    
                    
                }
                
                
            }
            catch {
                
                
            }
            
        }
    }
}
