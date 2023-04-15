//
//  DataServices.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/6/23.
//

import Foundation
import CoreLocation
import Combine
import SwiftUI

//class RestaurantDataService:  NSObject, CLLocationManagerDelegate, ObservableObject {
//
//    /// This service leverages the location of the user and also a manual location search
//    ///
//    @Published var authorizationState = CLAuthorizationStatus.notDetermined
//    @Published var restaurants = [Business]()
////    @Published var sights = [Business]()
//    @Published var placemark : CLPlacemark?
//    @Published var locationManager = CLLocationManager()
//    @Published var userLocation : CLLocation?
//
//    // MARK: - Core Location -
//
//    override init() {
//
//        // Call init method of NSObject
//        super.init()
//
//        // Set ContentModel as the delegate of the locationManager
//        locationManager.delegate = self
//
//        requestGeolocationPermission()
//
//    }
//
//    // MARK: - Request Geolocation permisson -
//
//    func requestGeolocationPermission() {
//
//        // Request permission from user to use location
//        locationManager.requestWhenInUseAuthorization()
//    }
//
//    // MARK: - Location Manager Delegate Methods -
//
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//
//        // Update the authorizationState property
//        authorizationState = locationManager.authorizationStatus
//
//
//        if locationManager.authorizationStatus == .authorizedAlways ||
//        locationManager.authorizationStatus == .authorizedWhenInUse {
//
//            // We have permission
//            // Start geolocating the user, after we get permission
//            locationManager.startUpdatingLocation()
//        }
//        else if locationManager.authorizationStatus == .denied {
//
//            // We don't have permission
//        }
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//
//        // Gives us the location of the user
//        let userLocation = locations.first
//        self.userLocation = userLocation
//
//        if userLocation != nil {
//
//            // We have a location
//
//            // Stop requesting the location after we get it once
//            locationManager.stopUpdatingLocation()
//
//            // Get the placemark of the user
//            let geoCoder = CLGeocoder()
//
//            geoCoder.reverseGeocodeLocation(userLocation!) { (placemarks, error) in
//
//                // Check that there aren't errors
//                if error == nil && placemarks != nil {
//
//                    // Take the first placemark
//                    self.placemark = placemarks?.first
//                }
//
//
//
//            }
//
//            // If we have the coordinates of the user, send it into Yelp API
// //           getBusinesses(category: Constants.sightsKey, location: userLocation!)
////            getBusinessesDefault(category: Constants.restaurantsKey, location: userLocation!)
//
//        }
//
//    }
    
//    // MARK: - Yelp API Methods -
//
//    func getBusinessesDefault(category:String, location:CLLocation) {
//
//        // Create URL
//        /*
//        let urlString = "https://api.yelp.com/v3/businesses/search?latitude=\(location.coordinate.latitude)&longitude=\(location.coordinate.longitude)&categories=\(category)&limit=6"
//        let url = URL(string: urlString)
//        */
//        var urlComponents = URLComponents(string: Constants.apiURL)
//            urlComponents?.queryItems = [
////                URLQueryItem(name: "term", value: String(location.coordinate.latitude)),
//                URLQueryItem(name: "term", value: "food"),
//                URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
//                URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
//                URLQueryItem(name: "categories", value: String(category)),
//                URLQueryItem(name: "categories", value: "food")
////               URLQueryItem(name: "sort_by", value: "review_count"),
////                URLQueryItem(name: "sort_by", value: "rating"),
////                URLQueryItem(name: "limit", value: "50")
//            ]
//        let url = urlComponents?.url
//
//        if let url = url { // not nil
//
//            // Create URL Request
//            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData , timeoutInterval: 10.0)
//
//                // End point of yelp api
//                request.httpMethod = "GET"
//
//                // Header and authorization and API Key
//            request.addValue("Bearer \(Constants.apiKey)", forHTTPHeaderField: "Authorization")
//
//
//            // Get URL Session
//            let session = URLSession.shared
//
//            // Create DataTask
//            let dataTask = session.dataTask(with: request) { (data, response, error) in
//
//                // Check that there isn't an error
//                if error == nil {
//
//
//                    do {
//                        // Parse json
//                        let decoder = JSONDecoder()
//                        let result = try decoder.decode(BusinessSeach.self, from: data!)
//
//
//                        // Sort the businesses
//                        var businesses = result.businesses
//                        businesses.sort { (b1, b2) -> Bool in
//                            return b1.distance ?? 0 < b2.distance ?? 0
//                        }
//
//                        // Call the get image function of the businesses
//                        for b in businesses {
//                            b.getImageData()
//                        }
//
//
//                        DispatchQueue.main.async {
//
//                            // Assign results to the appropriate property
//                                /*
//                                 if category == Constants.sightsKey {
//                                 self.sights = result.businesses
//                                 }
//                                 else if category == Constants.restaurantsKey {
//                                 self.restaurants = result.businesses
//                                 }
//                                 */
//                            // use switch statement to handle each case. More effecient than if statements
//                            switch category {
////                            case Constants.sightsKey:
////                                self.sights = businesses
//                            case Constants.restaurantsKey:
//                                self.restaurants = businesses
//                            default:
//                                break
//                            }
//                        }
//                    }
//                    catch {
//                        // Couldn't parse Json
//                        print(error)
//                    }
//
//
//                }
//
//            }
//
//            // Start the DataTask
//                dataTask.resume()
//        }
//
//    }
//
//    func getBusinessesLiveSearch(term: String, location: CLLocation, categories: String) {
//
//    }
//
//}

struct YelpAPIService {
    // search term, user location, category    // output to update list
    
    var request : (Endpoint) ->AnyPublisher<[Business], Never>
    
}

extension YelpAPIService {
    static let live = YelpAPIService { endpoint in
        
        // URL Request and return [Businesses}
        return URLSession.shared.dataTaskPublisher(for: endpoint.request)
            .map(\.data)
            .breakpointOnError()
            .decode(type: SearchResult.self, decoder: JSONDecoder())
            .map(\.businesses)
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}


enum Endpoint {
    
    case search(term: String?, location: CLLocation, category: FoodCategory?)
    case detail(id: String)
    
    var path : String {
        switch self {
        case .search:
            return "/v3/businesses/search"
        case .detail(let id) :
            return "/v3/businesses/\(id)"
        }
    }
    
    var queryItems : [URLQueryItem] {
        
        switch self {
            
        case .search(let term, let location, let category) :
            return [
                .init(name: "term", value: term),
                .init(name: "longitude", value: String(location.coordinate.longitude)),
                .init(name: "latitude", value: String(location.coordinate.latitude)),
                .init(name: "categories", value: category?.rawValue ?? FoodCategory.all.rawValue),
            ]
            
        case .detail :
            return []
            
        }
    }
    var request : URLRequest {
        var urlComponents = URLComponents(string: "https://api.yelp.com")!
        urlComponents.path = path
        urlComponents.queryItems = queryItems
        let url = urlComponents.url!
        var request = URLRequest(url: url)
        request.addValue("Bearer \(Constants.apiKey)", forHTTPHeaderField: "Authorization")
        
        return request
        
    }
}

struct SearchResult: Decodable {
    
    let businesses : [Business]

    
}

//extension Business {
//
//    var formattedImageUrl: URL? {
//        if let Business.imageUrl = imageURL {
//            return URL(string: imageUrl)
//        }
//        return nil
//    }
//
//}

