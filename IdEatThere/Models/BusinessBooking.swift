//
//  BusinessBooking.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 7/10/23.
//

import Foundation

// MARK: - Business Booking
class BusinessBooking : Decodable, Identifiable, ObservableObject {
    let reservationTimes: [ReservationTime]?

    enum CodingKeys: String, CodingKey {
        case reservationTimes = "reservation_times"
    }
}

// MARK: - ReservationTime
struct ReservationTime: Codable {
    let date: String?
    let times: [Time]?
}

// MARK: - Time
struct Time: Codable {
    let creditCardRequired: Bool?
    let time: String?

    enum CodingKeys: String, CodingKey {
        case creditCardRequired = "credit_card_required"
        case time
    }
}

