//
//  AllHostAttendBarView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 4/19/23.
//

import SwiftUI

enum TabsSelections : Int {
    
    case all = 0
    case host = 1
    case attend = 2
    
}

struct AllHostAttendBarView: View {
    
    @Binding var groupTabSelection : TabsSelections
    
    var body: some View {
        
        
        GeometryReader {geo in
            
            HStack(alignment: .center) {
                
                // --- All ---
                Button {
                    groupTabSelection = .all
                } label: {
                    TabBarButton(
                        buttonText: "All",
                        imageName: "",
                        isActive: groupTabSelection == .all)
                }
                
                
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
            
        }
        
        
        
    }
}

//struct AllHostAttendBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllHostAttendBarView()
//    }
//}
