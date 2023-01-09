//
//  MyGroupsView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

struct MyGroupsView: View {
    
    @EnvironmentObject var myGroupsModel : MyGroupsModel

    
    
    var body: some View {
        
        if myGroupsModel.hasGroups == true {
            
            NavigationView {
                
                ZStack(alignment: .top) {
                    
                    ScrollView() {

                        
                        Text("Here are you groups")
                        
                        
                        
                    }
                }
                             .navigationTitle("My Groups")
                
            }
        }
        
        else {
            
            ZStack {
                
                NavigationView {
                    
                    
                    NoGroupsYet()
                    
                        .navigationTitle("")
                    //      .font(Font.headingFont)
                    //  .foregroundColor(Color.theme.accent)
                }
            }
        }
    }
}

//struct MyGroupsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyGroupsView()
//            .environmentObject(UserManagerModel())
//    }
//}
