//
//  BusinessDetailView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 7/11/23.
//

import SwiftUI

struct BusinessBookingView: View {
    
    var businessBooking : BusinessBooking
    
    var body: some View {
        
        
        ForEach(businessBooking.reservationTimes!) {booking in
            
            Text(booking.date ?? "")
        }
        
    }
}

//struct BusinessDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        BusinessDetailView()
//    }
//}
