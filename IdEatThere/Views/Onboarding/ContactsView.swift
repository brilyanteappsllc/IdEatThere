//
//  ContactsView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/10/23.
//

import SwiftUI

struct ContactsView: View {
    
    @EnvironmentObject var contactsModel : ContactsModel
    var body: some View {
        
        VStack {
          
            Text("Contacts")
                .bold()
                .font(.title)
                .padding(.top, 52)
            
            Text("By syncing your contacts, you will be able to create and be invited to groups!")
                .padding(.top, 12)
                .font(.body)
            

//            Text(" e.g. 123456 ", text: "")
//                .textFieldStyle(OnboardingTextFields())
//
//
//            Spacer()
//
//
//
//            Text("By tapping 'Verify' you agree to our Privacy Policy")
//                .multilineTextAlignment(.center)
//                .padding(.bottom, 70)
                
          
          

        }
        .padding(.horizontal)
        .onAppear{
            contactsModel.getLocalContacs()
        }
        
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
