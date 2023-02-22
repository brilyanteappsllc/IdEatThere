//
//  MapView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI
import CoreLocation

struct MapView: View {
    
    @State var isMapShowing = false
    @State var selectedBusiness: Business?
    
    @EnvironmentObject var model: RestaurantsContentModel
    @EnvironmentObject var modelLocation : RestaurantDataService
    
    var body: some View {
        
        
        
        // Navigation View
        
        NavigationView {
            
            // If there is data
            if model.restaurants.count != 0 ||
                model.sights.count != 0 {
                
                // Determine if we should show list or map
                
                // MARK: List View
                if isMapShowing == false {
                    
                    // MARK: - List View -
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "location")
                            Text(model.placemark?.locality ?? "") //city associated with placemark
                            Spacer()
                            //                            Button {
                            //                                self.isMapShowing = true
                            //                            } label: {
                            //                                CircleButton(iconName: "chevron.right")
                            //                            }
                            
                            Button("Switch to map view") {
                                self.isMapShowing = true
                            }
                            .foregroundColor(Color.theme.blackText)
                            
                        }
                        
                        Divider()
                        
                        // - BusinessList View -
                        FilterButton(searchText: $model.searchText, filterOptions: $model.filterOptions)
                        ZStack (alignment: .top) {
                            
                            BusinessList()
                            
                            //                            HStack {
                            //                                Spacer()
                            //                                YelpAttribution(link: "https://yelp.ca")
                            //                            }
                            
                            
                        }
                        
                        
                    }
                    .padding([.horizontal, .top])
                    .navigationBarHidden(true)
                    
                }
                
                // MARK: Map View
                else {
                    ZStack(alignment: .top) {
                        
                        // Show map
                        BusinessMap(selectedBusiness: $selectedBusiness)
                            .ignoresSafeArea()
                            .sheet(item: $selectedBusiness) { business in
                                
                                // Create a business detail view instance
                                // Pass in the selected business
                                BusinessDetail(business: business)
                            }
                        
                        // Rectangle overlay
                        ZStack{
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(5)
                                .frame(height: 48)
                            HStack {
                                Image(systemName: "location")
                                    .foregroundColor(.black)
                                Text(model.placemark?.locality ?? "") //city associated with placemark
                                    .foregroundColor(.black)
                                Spacer()
                                Button("Switch to list view") {
                                    self.isMapShowing = false
                                }
                                .accentColor(.black)
                            }
                            .padding()
                        }
                        .padding()
                    }
                    .navigationBarHidden(true) // Xcode13: beed to implement on first child of the parent
                    
                }
            }
            else  {
     //           Still waiting for data, so show spinner and check user location permission
                if modelLocation.authorizationState == CLAuthorizationStatus.denied  {
                    LocationDeniedView()
                }
                else {
                    ProgressView()
                }
                
            }
        }
        .accentColor(.white)
        .onAppear{
            modelLocation.requestGeolocationPermission()
        }
        
        
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .environmentObject(RestaurantsContentModel())
    }
}