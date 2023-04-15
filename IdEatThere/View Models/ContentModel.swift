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
    
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
    @Published var restaurants : [Business] = []
    @Published var sights : [Business] = []
    
    @Published var placemark : CLPlacemark?
    @Published var locationManager = CLLocationManager()
    @Published var userLocation : CLLocation?
    
    enum filterOption {
        case none, reviews, stars, isOpen, takesReservations
    }
    
    var filterTagData = [
        FilteredTagData(imageName: "rectangle.and.pencil.and.ellipsis", title: "1000 Review Count", filter: filterOption.reviews),
        FilteredTagData(imageName: "star.circle", title: "At Least 4 Stars", filter: filterOption.stars),
        FilteredTagData(imageName: "envelope.open", title: "Is Open", filter: filterOption.isOpen),
        FilteredTagData(imageName: "phone", title: "Takes Reservations", filter: filterOption.takesReservations)
    ]
    @Published var selection = [FilteredTagData]()
    @Published var filteredRestaurants : [Business] = []
    @Published var mySelectedRestaurants : [Business] = []
    @Published var searchText: String = ""
    @Published var filterOptions : filterOption = .none
    @Published var selectedCategory : FoodCategory = .all
    
//    private let dataService = RestaurantDataService()
    private let userLocationService = UserLocationService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        
       addSubscribers()
        
        apiRequest()
        
    }
    
    func apiRequest(service: YelpAPIService = .live) {
        
        // Need to make sure we have the location of the user before request to yelp API
        if locationManager.location != nil {
            
            let live = YelpAPIService.live
            
            live.request(
                .search(
                    term: searchText,
                    location: locationManager.location! ,
                    category: selectedCategory)
            )
            .assign(to: &$restaurants)
            
            $searchText
                .combineLatest($selectedCategory)
                .flatMap { [self] (term, category) in
                    
                    live.request(
                        .search(
                            term: term,
                            location: locationManager.location!,
                            category: term.isEmpty ? category : nil))
                    
                }
                .assign(to: &$restaurants)
            
        }
        
    }
    
    
    func addSubscribers() {
//
//        dataService.$restaurants
//            .sink { [weak self] (returnedRestaurants) in
//                self?.restaurants = returnedRestaurants
//            }
//            .store(in: &cancellables)
//
//        dataService.$authorizationState
//            .sink { [weak self] (returnedAuthorizationState) in
//                self?.authorizationState = returnedAuthorizationState
//            }.store(in: &cancellables)
//
////        dataService.$sights
////            .sink { [weak self] (returnedSights) in
////                self?.sights = returnedSights
////            }.store(in: &cancellables)
//
        userLocationService.$placemark
            .sink { [weak self] (returnedPlaceMark) in
                self?.placemark = returnedPlaceMark
            }.store(in: &cancellables)
//
        userLocationService.$locationManager
            .sink { [weak self] (returnedLocationManager) in
                self?.locationManager = returnedLocationManager
            }.store(in: &cancellables)
//        
//        dataService.$userLocation
//            .sink { [weak self] (returneduserLocation) in
//                self?.userLocation = returneduserLocation
//            }.store(in: &cancellables)

        // Filters the restaurants based on user input for search bar text and selected catagories
//        $searchText
//            .combineLatest(dataService.$restaurants, $filterOptions)
//            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
//            .map(filterRestaurantsByCategory)
//            .sink { [weak self] (returnedRestaurants) in
//                self?.restaurants = returnedRestaurants
//            }
//            .store(in: &cancellables)

        // Create new request for category selected
//        $selectedCategory
//            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
//            .map(foodCategorySearch(foodCategory: selectedCategory))



   }
    
//    private func foodCategorySearch(foodCategory: FoodCategory, service: YelpAPIService = .live) {
//
//        let live = YelpAPIService.live
//
//        live.request(
//
//            .search(term: "", category: foodCategory))
//
//        .assign(to: &$restaurants)
//
//
//    }
    
    private func filterRestaurantsByCategory(text: String, restaurants: [Business], filter: filterOption) -> [Business] {
        var searchedRestaurants = filterRestaurantsByTextSearch(text: text, restaurants: restaurants)
        
        // Filter by category
        let filteredRestaurants = filterCategory(filter: filter, restaurants: searchedRestaurants)
        
        return filteredRestaurants
        
        
    }
    
    private func filterRestaurantsByTextSearch(text: String, restaurants: [Business]) -> [Business] {
        
        guard !text.isEmpty else {
            return restaurants
        }
        let lowerCasedText = text.lowercased()
        return restaurants.filter { (restaurant) in
            return restaurant.name!.lowercased().contains(lowerCasedText) || restaurant.alias!.lowercased().contains(lowerCasedText)
        }
        
    }
    
    private func filterCategory(filter: filterOption, restaurants: [Business]) -> [Business] {

        switch filter {
        case .none :

            return restaurants

        case .stars :
            return restaurants.filter { business in
                return business.rating ?? 1 > 4
            }
        case .reviews :
            return restaurants.filter { business in
                return business.reviewCount ?? 100 >= 1000
            }

        case .isOpen :
            return restaurants.filter { business in
                return !(business.isClosed ?? false)
            }

        case .takesReservations :
            return restaurants

        }

    }

        
    
    
    // MARK: - Filtering Button
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
    
    
//    func updateFilteredRestaurants(filter: FilteredTagData.filter) -> [Business] {
//
//        switch filter {
//
//        case .none :
//            return filteredRestaurants
//
//        case .isOpen :
//            filteredRestaurants = restaurants.filter({ business in
//                !(business.isClosed ?? false) })
//
//            return filteredRestaurants
//
//        case .stars :
//            filteredRestaurants = restaurants.filter({ business in
//                business.rating ?? 0 >= 4
//            })
//
//            return filteredRestaurants
//
//        case .reviews :
//            filteredRestaurants = restaurants.filter({ business in
//                business.reviewCount ?? 0 <= 500
//            })
//            return filteredRestaurants
//
//        case .takesReservations :
//            return restaurants
//        }
//
//
//    }
//
}
