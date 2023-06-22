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
    
//    var request : (Endpoint) ->AnyPublisher<[Business], Never>
//    var details : (Endpoint) ->AnyPublisher<Business?, Never>
//    var autoCompletion : (Endpoint) ->AnyPublisher<[Term], Never>
    
    // default request for restaurants
    var defaultRequest : (Endpoint) ->AnyPublisher<[Business], Never>

    // request for selected business details
    var businessDetails : (Endpoint) ->AnyPublisher<Business?, Never>

    // request for food categories
    var foodCategoryRequest : (Endpoint) ->AnyPublisher<[Business], Never>

    // request for filter restaurants
    var attributeRequest : (Endpoint) ->AnyPublisher<[Business], Never>

    // request for sorting restaurants
    var sortRequest : (Endpoint) ->AnyPublisher<[Business], Never>

    // request for filter + sort restaurants
    var comboRequest : (Endpoint) ->AnyPublisher<[Business], Never>

    // autocomplete search request
    var searchAutoCompletion : (Endpoint) ->AnyPublisher<[Term], Never>
    
}

extension YelpAPIService {
    static let live = YelpAPIService(defaultRequest:  { endpoint in
        
        // URL Request and return [Businesses] list
        return URLSession.shared.dataTaskPublisher(for: endpoint.request)
            .map(\.data)
            .breakpointOnError()
            .decode(type: SearchResult.self, decoder: JSONDecoder())
            .map(\.businesses)
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }, businessDetails: { endpoint  in
        
        // URL Request and return Businesses details
        return URLSession.shared.dataTaskPublisher(for: endpoint.request)
            .map(\.data)
            .breakpointOnError()
            .decode(type: Business?.self, decoder: JSONDecoder())
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }, foodCategoryRequest: { endpoint in
        // URL Request and return [Businesses] list
        return URLSession.shared.dataTaskPublisher(for: endpoint.request)
            .map(\.data)
            .breakpointOnError()
            .decode(type: SearchResult.self, decoder: JSONDecoder())
            .map(\.businesses)
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }, attributeRequest: { endpoint in
        // URL Request and return [Businesses] list
        return URLSession.shared.dataTaskPublisher(for: endpoint.request)
            .map(\.data)
            .breakpointOnError()
            .decode(type: SearchResult.self, decoder: JSONDecoder())
            .map(\.businesses)
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }, sortRequest: { endpoint in
        // URL Request and return [Businesses] list
        return URLSession.shared.dataTaskPublisher(for: endpoint.request)
            .map(\.data)
            .breakpointOnError()
            .decode(type: SearchResult.self, decoder: JSONDecoder())
            .map(\.businesses)
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }, comboRequest: { endpoint in
        // URL Request and return [Businesses] list
        return URLSession.shared.dataTaskPublisher(for: endpoint.request)
            .map(\.data)
            .breakpointOnError()
            .decode(type: SearchResult.self, decoder: JSONDecoder())
            .map(\.businesses)
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }) { endpoint in
        return URLSession.shared.dataTaskPublisher(for: endpoint.request)
            .map(\.data)
            .breakpointOnError()
            .decode(type: Completions.self, decoder: JSONDecoder())
            .map(\.terms)
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

enum Endpoint {
    
    case search(term: String?, location: CLLocation, category: FoodCategory?, attributes: AttributeOptions?, sort: SortOptions?)
    case detail(id: String)
    case autoCompletion(text: String, location: CLLocation)
    
    var path : String {
        switch self {
        case .search:
            return "/v3/businesses/search"
        case .detail(let id) :
            return "/v3/businesses/\(id)"
        case .autoCompletion :
            return "/v3/autocomplete"
        }
    }
    
    var queryItems : [URLQueryItem] {
        
        switch self {
            
        case .search(let term, let location, let category, let attribute, let sort) :
            return [
                .init(name: "term", value: term),
                .init(name: "longitude", value: String(location.coordinate.longitude)),
                .init(name: "latitude", value: String(location.coordinate.latitude)),
                .init(name: "categories", value: category?.rawValue ?? FoodCategory.all.rawValue),
                .init(name: "attributes", value: attribute?.rawValue ?? AttributeOptions.none.rawValue),
                .init(name: "sort_by", value: sort?.rawValue ?? SortOptions.none.rawValue),
            ]
            
        case .detail :
            return []
            
            
        case .autoCompletion(let text, let location) :
            return [
                .init(name: "text", value: text),
                .init(name: "longitude", value: String(location.coordinate.longitude)),
                .init(name: "latitude", value: String(location.coordinate.latitude)),
            ]
            
        }
    }
    var request : URLRequest {
        var urlComponents = URLComponents(string: "https://api.yelp.com")!
        urlComponents.path = path
        urlComponents.queryItems = queryItems
        let url = urlComponents.url!
        var request = URLRequest(url: url)
        
        #if DEBUG
        request.addValue("Bearer \(Constants.apiKeySandBox)", forHTTPHeaderField: "Authorization")
        
        #else
        request.addValue("Bearer \(Constants.apiKeyProd)", forHTTPHeaderField: "Authorization")
      
        
        #endif
        return request
        
    }
}

struct Completions : Decodable {
    var terms : [Term]
    var businesses : [Business]
    var categories : [Category]
    
}

struct Term : Decodable {
    var text : String
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

