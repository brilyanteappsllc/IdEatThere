//
//  MyGroupsView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

struct MyGroupsView: View {
    
    
    var body: some View {
        
        
        NavigationView {
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Hi")
                }
            }
            
            
            .navigationTitle("I'd Eat That")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
        }
        }
    }
}

struct MyGroupsView_Previews: PreviewProvider {
    static var previews: some View {
        MyGroupsView()
    }
}
