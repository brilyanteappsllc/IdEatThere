//
//  SelectedGroupView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 2/16/23.
//

import SwiftUI

struct SelectedGroupView: View {
    
    var groups : Groups
    
    var body: some View {
        
        let host = groups.host?[0]
        
        VStack {
            Text("GroupId: \(groups.id ?? "")")
            Text("GroupName: \(groups.groupName ?? "")")
            Text("GroupHost: \(host ?? "")")
        }
        
        
    }
}

//struct SelectedGroupView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectedGroupView()
//    }
//}
