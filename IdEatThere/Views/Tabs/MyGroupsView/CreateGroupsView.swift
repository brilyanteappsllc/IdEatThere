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
    
    @Binding var hasGroups : Bool
    
    var body: some View {
        
        Button {
            
            self.hasGroups = true
            dismiss()
            dismiss.callAsFunction()
        } label: {
            Text("Create Group Test")
        }

        
//        NavigationView {
//
//            Text("Hi")
//
//
//                .navigationTitle("I'd Eat That")
//                .navigationBarTitleDisplayMode(.inline)
//                .toolbar {
//                    ToolbarItem(placement: .principal) {
//                        XMarkButton()
//                    }
//
//        }
//
//
//        }
    }
}

//struct CreateGroupsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateGroupsView()
//    }
//}
