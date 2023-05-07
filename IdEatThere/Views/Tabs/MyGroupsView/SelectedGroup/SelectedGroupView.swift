//
//  SelectedGroupView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 2/16/23.
//

import SwiftUI

    // TODO: Change view to operate in group details and add specific features and elements for applicability

struct SelectedGroupView: View {
    
    var groups : Groups
    var viewAsHost : Bool
     
    var body: some View {
        
        if viewAsHost {
            
            HostGroupView(groups: groups)
            
        }
        else {
            AttendeeGroupView(groups: groups)
        }
    }
}

//struct SelectedGroupView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectedGroupView(groups: Groups())
//            .environmentObject(MyGroupsModel())
//            .environmentObject(UserHostDetailsModel())
//    }
//}
