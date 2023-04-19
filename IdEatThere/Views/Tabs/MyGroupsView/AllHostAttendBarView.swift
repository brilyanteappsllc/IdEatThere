//
//  AllHostAttendBarView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 4/19/23.
//

import SwiftUI

enum TabsSelections : Int {
    
    case host = 0
    case attend = 1
    
}

struct AllHostAttendBarView: View {
    
    @Binding var groupTabSelection : TabsSelections
    
    var body: some View {
        
            
            HStack(alignment: .center) {
                
                // --- Host ---
                Button {
                    groupTabSelection = .host
                } label: {
                    TabBarButton(
                        buttonText: "Hosting",
                        imageName: "",
                        isActive: groupTabSelection == .host)
                }
                
                // --- Attending ---
                Button {
                    groupTabSelection = .attend
                } label: {
                    TabBarButton(
                        buttonText: "Attending",
                        imageName: "",
                        isActive: groupTabSelection == .attend)
                }
                
            }
            .padding(.horizontal)
        }
        
        
        
    }


//struct AllHostAttendBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllHostAttendBarView()
//    }
//}
