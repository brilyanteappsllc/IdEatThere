//
//  BusinessBooking.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 7/10/23.
//

import Foundation

// MARK: - Business Booking
struct BusinessBooking : Hashable, Codable, Identifiable{
    var id: String?
    var reservationTimes: [ReservationTime]?

    enum CodingKeys: String, CodingKey {
        case reservationTimes = "reservation_times"
    }
}

// MARK: - ReservationTime
struct ReservationTime: Hashable, Codable, Identifiable{
    var id: String?
    var date: String?
    var times: [Time]?

}

// MARK: - Time
struct Time: Hashable, Codable, Identifiable{
    
    var id: String?
    var creditCardRequired: Bool?
    var time: String?

    enum CodingKeys: String, CodingKey {
        case creditCardRequired = "credit_card_required"
        case time
    }
}

