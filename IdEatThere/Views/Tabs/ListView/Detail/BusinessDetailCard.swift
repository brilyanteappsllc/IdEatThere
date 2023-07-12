//
//  BusinessDetailCard.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 4/16/23.
//

import SwiftUI

struct BusinessDetailCard: View {
    
    @EnvironmentObject var restaurant : RestaurantsContentModel
    
    var business: Business
    
    var body: some View {
        
        ScrollView{
            
            // Card Details
            VStack(alignment: .leading) {
                
                Group {
                    
                    // BusinessTitle View
                    HStack {
                        BusinessTitle(business: business)
                            .padding(.horizontal)
                        
                    }
                    HStack {
                        
                        Spacer()
                        
                        CallButton(business: business)
                        
                        Spacer()
                        
                        ReviewsLinkButton(business: business)
                        
                        Spacer()
                        
                        MapLinkButton(business: business)
                        
                        Spacer()
                        
                        //                    YelpAttribution(link: business.url!)
                        //
                        //                    Spacer()
                    }
                }
                
                
                Group {
                    
                    TabView {
                        
                        ForEach(business.images, id: \.self) {url in
                            
                            AsyncImage.init(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                //                                .padding()
                            } placeholder: {
                                Color.gray
                            }
                        }
                    }
                    //TODO: Fix padding for images
                    .cornerRadius(50)
                    .tabViewStyle(.page)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                   
                restaurant.restaurantBooking != nil ?
                BusinessBookingView(businessBooking: restaurant.restaurantBooking!)
                : nil

            } // End of VStack
            
        }
//        .background(Color.white)
        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.45)
        .onAppear() {
            restaurant.apiRequestDetails(forId: business.id ?? "")
            restaurant.apiRequestBookingDetails(forId: business.id ?? "")
        }
    }
}



