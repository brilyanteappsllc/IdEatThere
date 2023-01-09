//
//  BusinessSectionHeader.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

struct BusinessSectionHeader: View {
    
    var title: String
    
    @ObservedObject var filterModel = ContentModel()
    
    var body: some View {
    
        ZStack (alignment: .leading) {
        
        Rectangle()
                .foregroundColor(Color.theme.accent)
            .cornerRadius(10)
            .frame(height: 50)
            
            Text(title)
                    .font(.headline)
                    .foregroundColor(Color.theme.secondaryText)
            
//            VStack {
//                Text(title)
//                    .font(.headline)
//                    .foregroundColor(Color.theme.secondaryText)
//                VStack {
//                            FilterBar()
//                                .environmentObject(filterModel)
//                            Spacer()
//                            List {
//                                ForEach(0..<filterModel.filterTagData.count) { index in
//                                    FilterTag(filterData: filterModel.filterTagData[index])
//                                        .onTapGesture {
//                                            filterModel.toggleFilter(at: index)
//                                            filterModel.updateFilteredRestaurants(filter: filterModel.filterTagData[index].filter)
//                                        }
//                                }
//                            }
//                        }
//                        .padding()
//           }

        
    }
        Divider()
}
}

