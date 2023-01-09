//
//  BusinessRow.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

struct BusinessRow: View {
    
    @ObservedObject var business: Business
    
    var distanceMiles: String {
        
        if (business.distance ?? 0) * 0.000621 > 1 {
            return "%.1f miles away"
        }
        else {
            return "%.1f mile away"
        }
    }
    
    
    var body: some View {
        
        VStack(alignment: .leading) { 
            
            HStack {
                // Image - need to fetch imageURL
                let uiImage = UIImage(data: business.imageData ?? Data())
                Image(uiImage: uiImage ?? UIImage()) // if nill us empty image
                    .resizable()
                    .frame(width: 58, height: 58)
                    .cornerRadius(5)
                    .scaledToFit()
                
                // Name and Distance
                VStack(alignment: .leading) {
                    Text(business.name ?? "")
                        .bold()
                        .foregroundColor(Color.theme.secondaryText)
                    // Formatting number of decimal places, f = floating point
                    Text(String(format: distanceMiles, (business.distance ?? 0) * 0.000621 )) // convert to miles
                        .font(.caption)
                        .foregroundColor(Color.theme.secondaryText)
                    
                }
                
                Spacer()
                
                // Star rating and number of reviews
                VStack(alignment: .leading) {
                    Image("regular_\(business.rating ?? 0)")
                    Text("\(business.reviewCount ?? 0) Reviews")
                        .font(.caption)
                        .foregroundColor(Color.theme.secondaryText)
                    
                }
                
            }
            DashedDivider()
                .padding(.vertical)
        }
    }
}



struct BusinessRow_Previews: PreviewProvider {
    static var previews: some View {
        BusinessRow(business: Business())
            .environmentObject(RestaurantsContentModel())
    }
}
