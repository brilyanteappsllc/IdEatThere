//
//  BusinessRow.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

struct BusinessRow: View {
    
    let business: Business
    
    var distanceMiles: String {
        
        if (business.distance ?? 0) * 0.000621 > 1 {
            return "%.1f miles away"
        }
        else {
            return "%.1f mile away"
        }
    }

    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            
            HStack {
                
                // Image - need to fetch imageURL
                AsyncImage(url: URL(string: business.imageURL ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 110, height: 110)
                .cornerRadius(10)
                .padding(5)

                
                // Name and Distance
                VStack(alignment: .leading, spacing: 0) {
                    Spacer()
                    Text(business.name ?? "")
                        .font(.bodyHeaderFont)
                        .foregroundColor(Color.theme.secondaryText)
                    // Formatting number of decimal places, f = floating point
                    Text(String(format: distanceMiles, (business.distance ?? 0) * 0.000621 )) // convert to miles
                        .font(.bodyFont)
                        .foregroundColor(Color.theme.secondaryText)
                    
                    Spacer()
                    
                    // Star rating and number of reviews
                    HStack {
                        Image("regular_\(business.rating ?? 0)")
                        
                        YelpAttribution(link: business.url ?? "", height: 30, width: 35)
                        
                    }
                    
                    Text("Based on \(business.reviewCount ?? 0) Reviews")
                        .font(.bodyFont)
                        .foregroundColor(Color.theme.secondaryText)
                    Spacer()
                }
                Spacer()
                
            }
            .padding(5)
            .background(.white)
            .cornerRadius(15)
            .shadow(radius: 0.5)
            
            
//            DashedDivider()
//                .padding(.vertical)
        }
        .padding(.horizontal)
    }
}



struct BusinessRow_Previews: PreviewProvider {
    static var previews: some View {
        BusinessRow(business: Business())
            .environmentObject(RestaurantsContentModel())
    }
}
