//
//  Business.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import Foundation

class Business: Decodable, Identifiable, ObservableObject {
    
    // Data we download for image
    @Published var imageData: Data?
    
    var id, alias, name: String?
    var imageURL: String?
    var isClaimed, isClosed: Bool?
    var url: String?
    var phone, displayPhone: String?
    var reviewCount: Int?
    var categories: [Category]?
    var rating: Double?
    var location: Location?
    var coordinates: Coordinates?
    var photos: [String]?
    var price: String?
    var hours: [Hour]?
    var transactions: [String]?
    var specialHours: [SpecialHour]?
    var distance: Double?
    var data: data?

    enum CodingKeys: String, CodingKey {
        case id, alias, name
        case imageURL = "image_url"
        case isClaimed = "is_claimed"
        case isClosed = "is_closed"
        case url, phone
        case displayPhone = "display_phone"
        case reviewCount = "review_count"
        case categories, rating, location, coordinates, photos, price, hours, transactions
        case specialHours = "special_hours"
        case distance
        case data
        
    }
    
    func getImageData(){
        
        // Check that image url isn't nil
        guard imageURL != nil else {
            return
        }
        
        // Download the data for the image
        if let url = URL(string: imageURL!) {
            
            // Get session
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) { (data, response, error) in
                
                if error == nil {
                    
                    // Update to main thread
                    DispatchQueue.main.async {
                        
                        // Set the image data
                        self.imageData = data!
                    }
                }
            }
            dataTask.resume()
        }
    }
}

struct Location: Decodable {
    var address1, address2, address3, city: String?
    var zipCode, country, state: String?
    var displayAddress: [String]?
    var crossStreets: String?

    enum CodingKeys: String, CodingKey {
        case address1, address2, address3, city
        case zipCode = "zip_code"
        case country, state
        case displayAddress = "display_address"
        case crossStreets = "cross_streets"
    }
}

// MARK: - Hour
struct Hour: Decodable {
    var hourOpen: [Open]?
    var hoursType: String?
    var isOpenNow: Bool?

    enum CodingKeys: String, CodingKey {
        case hourOpen = "open"
        case hoursType = "hours_type"
        case isOpenNow = "is_open_now"
    }
}

// MARK: - Open
struct Open: Codable {
    var isOvernight: Bool?
    var start, end: String?
    var day: Int?

    enum CodingKeys: String, CodingKey {
        case isOvernight = "is_overnight"
        case start, end, day
    }
}

// MARK: - SpecialHour
struct SpecialHour: Codable {
    var date: String?
    var isClosed: Bool?
    var start, end: String?
    var isOvernight: Bool?

    enum CodingKeys: String, CodingKey {
        case date
        case isClosed = "is_closed"
        case start, end
        case isOvernight = "is_overnight"
    }
}

// MARK: - Reservation Data
struct data : Decodable {
    
    var reservationOpenings: [String]

    enum CodingKeys: String, CodingKey {
        case reservationOpenings = "reservation_openings"
    }
}



    enum CodingKeys: String, CodingKey {
        case creditCardRequired = "credit_card_required"
        case time, url
    }



struct Category: Decodable {
    
    var alias: String?
    var title: String?
}

// MARK: - Coordinates
struct Coordinates: Decodable {
    var latitude, longitude: Double?
}




extension Business {
    
    var images: [URL] {
        
        return photos?.compactMap { URL.init(string: $0) } ?? []
    }
}
