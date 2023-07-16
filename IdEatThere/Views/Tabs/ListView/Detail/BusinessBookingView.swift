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
        
        
        Text("Date Availble")
            .font(.bodyHeaderFontBold)
        ForEach(businessBooking.reservationTimes!, id: \.self) {booking in
            
            // Date
            Text(booking.date ?? "")
            
            // For each to loop through available times
            Text("Available Times")
                .font(.bodyHeaderFontBold)
            ForEach(booking.times!, id: \.self) { times in
                
                HStack{
                        // times
                        Text(times.time ?? "")

                        // credit card required?
                        Text(String(times.creditCardRequired!))

                    
                }
            }
        }
        
    }
}

//struct BusinessDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        BusinessDetailView()
//    }
//}
