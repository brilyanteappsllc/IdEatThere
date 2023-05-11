//
//  BusinessTitle.swift
//  CitySightsApp
//
//  Created by Brilyante Apps LLC on 2/2/22.
//

import SwiftUI

struct BusinessTitle: View {
    
    var business: Business
    var body: some View {
        
        VStack (alignment: .leading) {
            // - Business Name -
            
            HStack {
                Text(business.name!)
                    .font(.title2)
                    .bold()
                Spacer()
                YelpAttribution(link: business.url!, height: 40, width: 45)
            }

            // - Address - loop through display address -
            if business.location?.displayAddress != nil {
                
                ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                    Text(displayLine)
                        
                    
                }
            }
            
            Text(business.isClosed! ? "Closed..." : "Open!")
                .foregroundColor(business.isClosed! ? Color.theme.red : Color.theme.green)
            

            // - Star review -
            HStack {
                Text(String(business.rating ?? 0.0))
                    .font(.headline)
                Image("regular_\(business.rating ?? 0)")
//                Spacer()
                AddToMyGroupButton(business: business)
            }
        }

    }
}
