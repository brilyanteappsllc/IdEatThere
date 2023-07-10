//
//  BusinessBooking.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 7/10/23.
//

import Foundation


import Foundation

// MARK: - Welcome
struct BusinessBooking: Codable {
    let reservationTimes: [ReservationTime]
    let coversRange: CoversRange

    enum CodingKeys: String, CodingKey {
        case reservationTimes = "reservation_times"
        case coversRange = "covers_range"
    }
}

// MARK: - CoversRange
struct CoversRange: Codable {
    let minPartySize, maxPartySize: Int

    enum CodingKeys: String, CodingKey {
        case minPartySize = "min_party_size"
        case maxPartySize = "max_party_size"
    }
}

// MARK: - ReservationTime
struct ReservationTime: Codable {
    let date: String
    let times: [Time]
}

// MARK: - Time
struct Time: Codable {
    let creditCardRequired: Bool
    let time: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case creditCardRequired = "credit_card_required"
        case time, url
    }
}
