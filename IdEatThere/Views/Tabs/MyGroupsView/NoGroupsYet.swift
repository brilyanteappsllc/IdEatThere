//
//  NoGroupsYet.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/9/23.
//

import SwiftUI

struct NoGroupsYet: View {
    
    @StateObject var myGroupsModel = MyGroupsModel()
    
//    @Binding var hasGroups : Bool
    
    @State var presentCreateGroupView : Bool = false
    
    var body: some View {
        
        VStack {
            
            Image("Restaurant+reservations")
             //   .resizable()
             //   .scaledToFit()
                .ignoresSafeArea()
            
            
            
            Text(myGroupsModel.hasGroups ? "You have Groups" : "You are currently in no groups... ")
            
            
            Button {
//                self.hasGroups = true
                presentCreateGroupView.toggle()
                
            } label : {
                
                    HostButton()
            }
            Spacer()
            
        }
        .sheet(isPresented: $presentCreateGroupView) {
            CreateGroupsView(hasGroups: $myGroupsModel.hasGroups)
        }

    }
}

//struct NoGroupsYet_Previews: PreviewProvider {
//    static var previews: some View {
//        NoGroupsYet()
//    }
//}
