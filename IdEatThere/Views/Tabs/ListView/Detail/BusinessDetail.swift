//
//  BusinessDetail.swift
//  CitySightsApp
//
//  Created by Brilyante Apps LLC on 1/20/22.
//

import SwiftUI

struct BusinessDetail: View {
    
    var business: Business
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            VStack (alignment: .leading) {
                
                // - Image -
                GeometryReader() { geometry in
                
                    let uiImage = UIImage(data: business.imageData ?? Data())
                    Image(uiImage: uiImage ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                    
                }
                .ignoresSafeArea(.all, edges: .top)
                
            }
            
            Group {
                
                // BusinessTitle View
                HStack {
                    BusinessTitle(business: business)
                        .padding(.leading)
                    
                }
                
                Text(business.isClosed! ? "Closed..." : "Open!")
                    .foregroundColor(business.isClosed! ? Color.theme.red : Color.theme.green)
                    .padding(.leading)
                
                
                DashedDivider()
                
                // - Horizontal Categories -
                HStack {
                    Spacer()
                    
                    CallButton(business: business)
                    
                    Spacer()
                        
                    ReviewsLinkButton(business: business)
                    
                    Spacer()
                    
                    MapLinkButton(business: business)
                    
                    Spacer()
                    
                    YelpAttribution(link: business.url!)
                    
                    Spacer()
                }
                .padding()
                
                DashedDivider()

            }
            
            
            AddToMyGroupButton()
            

            Spacer()
        } // End of VStack
        
    }
}
