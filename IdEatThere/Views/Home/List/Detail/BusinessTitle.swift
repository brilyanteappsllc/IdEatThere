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
            Text(business.name!)
                .font(.title2)
                .bold()
                
            
            // - Address - loop through display address -
            if business.location?.displayAddress != nil {
                
                ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                    Text(displayLine)
                        
                    
                }
            }

            // - Star review -
            Image("regular_\(business.rating ?? 0)")
                .padding(.bottom, 5)
            
        }

    }
}
