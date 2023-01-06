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

class ContentModel: ObservableObject {
    
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
    @Published var restaurants = [Business]()
    @Published var sights = [Business]()
    
    @Published var placemark : CLPlacemark?
    @Published var locationManager = CLLocationManager()
    
    var filterTagData = [
        FilteredTagData(imageName: "rectangle.and.pencil.and.ellipsis", title: "Reviews", filter: .reviews),
        FilteredTagData(imageName: "star.circle", title: "Stars", filter: .stars),
        FilteredTagData(imageName: "envelope.open", title: "Is Open", filter: .isOpen),
        FilteredTagData(imageName: "phone", title: "Takes Reservations", filter: .takesReservations)
    ]
    @Published var selection = [FilteredTagData]()
    @Published var filteredRestaurants = [Business]()
    @Published var mySelectedRestaurants : [Business] = []
    @Published var searchText: String = ""
    
    private let dataService = RestaurantDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        
        addSubscribers()
        
    }
    
    func addSubscribers() {
        
        dataService.$restaurants
            .sink { [weak self] (returnedRestaurants) in
                self?.restaurants = returnedRestaurants
            }
            .store(in: &cancellables)
        
        dataService.$authorizationState
            .sink { [weak self] (returnedAuthorizationState) in
                self?.authorizationState = returnedAuthorizationState
            }.store(in: &cancellables)
        
        dataService.$sights
            .sink { [weak self] (returnedSights) in
                self?.sights = returnedSights
            }.store(in: &cancellables)
        
        dataService.$placemark
            .sink { [weak self] (returnedPlaceMark) in
                self?.placemark = returnedPlaceMark
            }.store(in: &cancellables)
        
        dataService.$locationManager
            .sink { [weak self] (returnedLocationManager) in
                self?.locationManager = returnedLocationManager
            }.store(in: &cancellables)

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
