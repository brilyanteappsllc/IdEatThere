//
//  ContentModel.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import Foundation
import CoreLocation
import Combine
import SwiftUI

class RestaurantsContentModel: ObservableObject {
    
    // Tracking restaurants
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
    @Published var restaurants : [Business] = [] // List
    @Published var restaurant : Business? // Details
    @Published var restaurantBooking : BusinessBooking? // booking details
    @Published var filteredRestaurants : [Business] = [] // Filtered
    
    @Published var sights : [Business] = []
    @Published var autoCompletion = [String]()
    
    @Published var placemark : CLPlacemark?
    @Published var locationManager = CLLocationManager()
    @Published var userLocation : CLLocation?
    
    @Published var searchText: String = ""
    @Published var selectedCategory : FoodCategory = .all
    @Published var selectedSort : SortOptions = .none
    @Published var selectedAttribute : AttributeOptions = .none
    
    
    
//    private let dataService = RestaurantDataService()
    private let userLocationService = UserLocationService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        
//       addSubscribers()
        
    /// We are only going to request from the api when we are on the specific view. No need to init this method.
    /// Moved to .onAppear in MapView()
    //   apiRequest()
        
    }
    
    func apiRequest(service: YelpAPIService = .live) {
        
        
        // Need to make sure we have the location of the user before request to yelp API
        if locationManager.location != nil {
            
            let live = YelpAPIService.live
            
            live.defaultRequest(
                .search(
                    term: searchText,
                    location: locationManager.location! ,
                    category: selectedCategory,
                    attributes: selectedAttribute,
                    sort: selectedSort,
                    time: "20:44",
                    date: "2023-07-25",
                    cover: "1")
            )
            .assign(to: &$restaurants)
            
            $searchText
                .debounce(for: 0.3, scheduler: DispatchQueue.main)
                .combineLatest($selectedCategory, $selectedAttribute, $selectedSort)
                .map { [self] (term, category, attributes, sort) in
                    
                    live.defaultRequest(
                        .search(
                            term: term,
                            location: locationManager.location!,
                            category: category,
                            attributes: attributes,
                            sort: sort,
                            time: "20:44",
                            date: "2023-07-25",
                            cover: "1"))
                    
                }
                .switchToLatest()
                .assign(to: &$restaurants)
            
            
            $searchText
                .debounce(for: 0.3, scheduler: DispatchQueue.main)
                .combineLatest($locationManager)
                .map { term, location in
                    live.searchAutoCompletion(
                        .autoCompletion(text: term, location: location.location ?? CLLocation(latitude: 37.2, longitude: 22.9)))
                }
                .switchToLatest()
                .map { $0.map(\.text)}
                .assign(to: &$autoCompletion)
            
        }
        
    }
    
    func apiRequestDetails(forId id : String) {
        
        let live = YelpAPIService.live
        
        let details = live
            .businessDetails(.detail(id: id))
            .share()
        
        details
            .assign(to: &$restaurant)
        
    }
    
    
    func apiRequestBookingDetails(forId id: String, time: String, date: String, covers: String) {
        
        // request group info first, if no errors, then create a request to the yelp api
//
//        let yelpDateInput = DateConverter().formattedDateFromString(dateString: date, withFormat: "YYYY-MM-DD")
//
//        print(yelpDateInput as Any)
        
        let live = YelpAPIService.live
        
        live.businessBooking(.booking_Openings(
                id: id,
                time: "18:30",
                date: "2023-07-25",
                covers: "4"
            ))
        .share()
        .assign(to: &$restaurantBooking)
        
    }
    
    func addSubscribers() {
        
        // MARK: - User Location
        userLocationService.$locationManager
            .sink { [weak self] (returnedLocationManager) in
                self?.locationManager = returnedLocationManager
            }.store(in: &cancellables)
        
        
        // MARK: - Placemark
        userLocationService.$placemark
            .sink { [weak self] (returnedPlaceMark) in
                self?.placemark = returnedPlaceMark
            }.store(in: &cancellables)




   }
    
}
