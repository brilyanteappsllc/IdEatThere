//
//  UserLocationServices.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 4/15/23.
//


import Foundation
import CoreLocation
import Combine
import SwiftUI


class UserLocationService:  NSObject, CLLocationManagerDelegate, ObservableObject {
    
    /// This service leverages the location of the user and also a manual location search
    ///
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
    @Published var placemark : CLPlacemark?
    @Published var locationManager = CLLocationManager()
    @Published var userLocation : CLLocation?
    
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
                else {
                    print(error)
                }

            }
            
        }
        
    }
    
}
