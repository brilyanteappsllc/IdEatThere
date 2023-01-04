//
//  BusinessList.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

struct BusinessList: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView(showsIndicators: false){
            LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                
                // - Restaruants -
                BusinessSection(title: "Restaurants", businesses: model.restaurants)
                
                // - Sights -
                // Off for now
 //               BusinessSection(title: "Sights", businesses: model.sights)
                
                
            } // End of LazyVstack
            
        } // End of ScrollView
    } // End of Body
}

struct BusinessList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessList()
    }
}
