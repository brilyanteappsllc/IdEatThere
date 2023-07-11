//
//  BusinessDetailView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 7/11/23.
//

import SwiftUI

struct BusinessBookingView: View {
    
    @EnvironmentObject var restaurant : RestaurantsContentModel
    
    var businessBooking: BusinessBooking
    
    
    var body: some View {
        
        Text(businessBooking.reservationTimes?.description ?? "")
        
    }
}

//struct BusinessDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        BusinessDetailView()
//    }
//}
