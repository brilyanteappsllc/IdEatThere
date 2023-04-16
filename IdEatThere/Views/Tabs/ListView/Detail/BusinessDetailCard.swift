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
        
        // Card Details
        VStack(alignment: .leading) {
            
            Group {
                
                // BusinessTitle View
                HStack {
                    BusinessTitle(business: business)
                        .padding(.leading)
                    
                }
                
                Text(business.isClosed! ? "Closed..." : "Open!")
                    .foregroundColor(business.isClosed! ? Color.theme.red : Color.theme.green)
                    .padding(.leading)
                
            }
            
            Group {
                
                TabView {
                    
                    ForEach(business.images, id: \.self) {url in
                        
                        AsyncImage.init(url: url) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                        } placeholder: {
                            Color.gray
                        }

                        
                    }
                    
                }
                .tabViewStyle(.page)
                
                
            }
            
            
            
            
            
            
            
            
            // - Horizontal Categories -
//            HStack {
//                Spacer()
//
//                CallButton(business: business)
//
//                Spacer()
//
//                ReviewsLinkButton(business: business)
//
//                Spacer()
//
//                MapLinkButton(business: business)
//
//                Spacer()
//
//                YelpAttribution(link: business.url!)
//
//                Spacer()
//            }
//            .padding()
                
//                    AsyncImage(url: URL(string: business.imageUrl ?? "")) { image in
//                        image
//                            .resizable()
//                    } placeholder: {
//                        ProgressView()
//                    }
//                    .scaledToFill()
//                    .clipped()
//
////                    let uiImage = UIImage(data: business.imageData ?? Data())
////                    Image(uiImage: uiImage ?? UIImage())
////                        .resizable()
////                        .scaledToFill()
////                        .frame(width: geometry.size.width, height: geometry.size.height)
////                        .clipped()
//
//                .ignoresSafeArea(.all, edges: .top)
            
            
//            AddToMyGroupButton(business: business)
            

//            Spacer()
        } // End of VStack
//        .background(Color.white)
        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.45)
        .onAppear() {
            print("\(business.id!)")
            
            restaurant.apiRequestDetails(forId: business.id ?? "")
        }
    }
}



