//
//  BusinessList.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

struct BusinessList: View {
    
    @EnvironmentObject var model: RestaurantsContentModel
    
    var body: some View {
        
        ScrollView(showsIndicators: false){
            LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                
                // - Restaruants -
                BusinessSection(title: "Top Restaurants in Your Area!", businesses: model.restaurants)
                
                // - Sights -
                // Off for now
 //               BusinessSection(title: "Sights", businesses: model.sights)
                
                
            }// End of LazyVstack
            .padding(.vertical, 10) // <-- added padding here to make space for shadow
            
        }// End of ScrollView
        .padding(.vertical, -10) // <-- added padding here to shrink space created with padding above
        
    } // End of Body
}

struct BusinessList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessList()
    }
}
