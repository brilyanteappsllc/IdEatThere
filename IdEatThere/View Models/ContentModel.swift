//
//  ContentModel.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import Foundation
import CoreLocation
import SwiftUI

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    var locationManager = CLLocationManager()
    
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
    @Published var restaurants = [Business]()
    @Published var sights = [Business]()
    
    @Published var placemark : CLPlacemark?
    
    
    var filterTagData = [
        FilteredTagData(imageName: "rectangle.and.pencil.and.ellipsis", title: "Reviews", filter: .reviews),
        FilteredTagData(imageName: "star.circle", title: "Stars", filter: .stars),
        FilteredTagData(imageName: "envelope.open", title: "Is Open", filter: .isOpen)
     //   FilteredBusinessData(imageName: "phone", title: "Takes Reservations")
    ]
    @Published var selection = [FilteredTagData]()
    @Published var filteredRestaurants = [Business]()
    @Published var mySelectedRestaurants : [Business] = []
    
    
    // MARK: - Core Location -
    
    override init() {
        
        // Call init method of NSObject
        super.init()
        
        // Set ContentModel as the delegate of the locationManager
        locationManager.delegate = self
    
    }
    
    // MARK: - Request Geolocation permisson -
    
    func requestGeolocationPermission() {
        
        // Request permission from user to use location
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    // MARK: - Location Manager Delegate Methods -
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        // Update the authorizationState property
        authorizationState = locationManager.authorizationStatus
        
        
        if locationManager.authorizationStatus == .authorizedAlways ||
        locationManager.authorizationStatus == .authorizedWhenInUse {
            
            // We have permission
            // Start geolocating the user, after we get permission
            locationManager.startUpdatingLocation()
        }
        else if locationManager.authorizationStatus == .denied {
            
            // We don't have permission
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Gives us the location of the user
        let userLocation = locations.first
        
        if userLocation != nil {
            
            // We have a location
            
            // Stop requesting the location after we get it once
            locationManager.stopUpdatingLocation()
            
            // Get the placemark of the user
            let geoCoder = CLGeocoder()
            
            geoCoder.reverseGeocodeLocation(userLocation!) { (placemarks, error) in
                
                // Check that there aren't errors
                if error == nil && placemarks != nil {
                    
                    // Take the first placemark
                    self.placemark = placemarks?.first
                }
                
                
                
            }
            
            // If we have the coordinates of the user, send it into Yelp API
            getBusinesses(category: Constants.sightsKey, location: userLocation!)
            getBusinesses(category: Constants.restaurantsKey, location: userLocation!)
            
        }
        
    }
    
    // MARK: - Yelp API Methods -
    
    func getBusinesses(category:String, location:CLLocation) {
         
        // Create URL
        /*
        let urlString = "https://api.yelp.com/v3/businesses/search?latitude=\(location.coordinate.latitude)&longitude=\(location.coordinate.longitude)&categories=\(category)&limit=6"
        let url = URL(string: urlString)
        */
        var urlComponents = URLComponents(string: Constants.apiURL)
            urlComponents?.queryItems = [
                URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
                URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
                URLQueryItem(name: "categories", value: String(category)),
//               URLQueryItem(name: "sort_by", value: "review_count"),
//                URLQueryItem(name: "sort_by", value: "rating"),
//                URLQueryItem(name: "limit", value: "60")
            ]
        let url = urlComponents?.url
        
        if let url = url { // not nil
            
            // Create URL Request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData , timeoutInterval: 10.0)
            
                // End point of yelp api
                request.httpMethod = "GET"
            
                // Header and authorization and API Key
            request.addValue("Bearer \(Constants.apiKey)", forHTTPHeaderField: "Authorization")
            
            
            // Get URL Session
            let session = URLSession.shared
            
            // Create DataTask
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                
                // Check that there isn't an error
                if error == nil {
                   
                    
                    do {
                        // Parse json
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(BusinessSeach.self, from: data!)
                        
                        
                        // Sort the businesses
                        var businesses = result.businesses
                        businesses.sort { (b1, b2) -> Bool in
                            return b1.distance ?? 0 < b2.distance ?? 0
                        }
                        
                        // Call the get image function of the businesses
                        for b in businesses {
                            b.getImageData()
                        }
    
                        
                        DispatchQueue.main.async {
                            
                            // Assign results to the appropriate property
                                /*
                                 if category == Constants.sightsKey {
                                 self.sights = result.businesses
                                 }
                                 else if category == Constants.restaurantsKey {
                                 self.restaurants = result.businesses
                                 }
                                 */
                            // use switch statement to handle each case. More effecient than if statements
                            switch category {
                            case Constants.sightsKey:
                                self.sights = businesses
                            case Constants.restaurantsKey:
                                self.restaurants = businesses
                                self.filteredRestaurants = self.restaurants
                            default:
                                break
                            }
                        }
                    }
                    catch {
                        // Couldn't parse Json
                        print(error)
                    }
                     
                
                }
                
            }
            
            // Start the DataTask
                dataTask.resume()
        }
        
    }
    
    // MARK: - Filtering the Restaurants
    // 3. toggles the selection of the filter at the given index
    func toggleFilter(at index: Int) {
        guard index >= 0 && index < filterTagData.count else { return }
        filterTagData[index].isSelected.toggle()
        refreshSelection()
    //    updateFilteredRestaurants(filter: filterTagData[index].filter)
    }
    
    // 4. clears the selected items
    func clearSelection() {
        for index in 0..<filterTagData.count {
            filterTagData[index].isSelected = false
        }
        refreshSelection()
        self.filteredRestaurants = self.restaurants
    }
    
    // 5. remakes the published selection list
    private func refreshSelection() {
        let result = filterTagData.filter{ $0.isSelected }
        withAnimation {
            selection = result
        }
        

        
    
    }
    
    func updateFilteredRestaurants(filter: FilteredTagData.filter) -> [Business] {
        
        switch filter {
            
        case .none :
            return filteredRestaurants
            
        case .isOpen :
            filteredRestaurants = restaurants.filter({ business in
                !(business.isClosed ?? false) })
            
            return filteredRestaurants
        
        case .stars :
            filteredRestaurants = restaurants.filter({ business in
                business.rating ?? 0 >= 4
            })
            
            return filteredRestaurants
            
        case .reviews :
            filteredRestaurants = restaurants.filter({ business in
                business.reviewCount ?? 0 <= 500
            })
            return filteredRestaurants
        }
        
        
    }
    
}
