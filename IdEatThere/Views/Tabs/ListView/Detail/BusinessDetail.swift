//
//  BusinessDetail.swift
//  CitySightsApp
//
//  Created by Brilyante Apps LLC on 1/20/22.
//

import SwiftUI

struct BusinessDetailView: View {
    
    @EnvironmentObject var restaurant : RestaurantsContentModel
    
    var business: Business
    
    var body: some View {
        
        
        ZStack(alignment: .top) {
            
            //Spacer
            Rectangle()
                .fill(Color.clear)
            
            //Map View
            DirectionsMap(business: business)
                .frame(height: UIScreen.main.bounds.height * 0.45)
            
        }
        .overlay (
            
            restaurant.restaurant != nil ?
            BusinessDetailCard(business: restaurant.restaurant!)
                .cornerRadius(10)
            : nil,
        alignment: .bottom
        )
        .ignoresSafeArea(edges: .top)
        .onAppear {
            restaurant.apiRequestDetails(forId: business.id ?? "")
        }
            
        
    }
}


//struct BusinessDetail_Previews: PreviewProvider {
//    static var previews: some View {
//       BusinessDetail()
//    }
//}
