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
        
        
        // For each to loop through available dates
        ForEach(businessBooking.reservationTimes!) {booking in
            
            // Date
            Text(booking.date ?? "")
            
                // For each to loop through available times
                ForEach(booking.times!) { times in
                
                    // times
                    Text(times.time ?? "")
                
                    // credit card required?
                    Text(String(times.creditCardRequired!))
            }
        }
        
    }
}

//struct BusinessDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        BusinessDetailView()
//    }
//}
