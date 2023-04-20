//
//  SelectedGroupRestaurantDetailView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 4/19/23.
//

import SwiftUI

struct SelectedGroupRestaurantDetailView: View {
    
    @EnvironmentObject var myGroupsModel : MyGroupsModel
    
    var id : String
    
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            //Spacer
            Rectangle()
                .fill(Color.clear)
            
            //Map View
            myGroupsModel.groupsRestaurantDetails != nil ?
            DirectionsMap(business: myGroupsModel.groupsRestaurantDetails ?? Business())
                .frame(height: UIScreen.main.bounds.height * 0.45)
            : nil
            
        }
        .overlay (
            
            myGroupsModel.groupsRestaurantDetails != nil ?
            BusinessDetailCard(business: myGroupsModel.groupsRestaurantDetails!)
                .cornerRadius(10)
            : nil,
        alignment: .bottom
        )
        .ignoresSafeArea(edges: .top)
        .onAppear {
            myGroupsModel.apiRequestDetails(forId: id)
        }
        
    }
}

//struct SelectedGroupRestaurantDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectedGroupRestaurantDetailView()
//    }
//}
