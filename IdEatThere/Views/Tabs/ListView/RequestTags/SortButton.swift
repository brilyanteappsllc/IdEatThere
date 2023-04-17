//
//  SortButton.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 4/17/23.
//

import SwiftUI

struct SortButton: View {
    
    @EnvironmentObject var sortModel : RestaurantsContentModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            //            Group {
            //                SearchBar(searchText: $filterModel.searchText)
            //                    .padding(.horizontal)
            //            }
            
            Group {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(SortOptions.allCases, id: \.self) { sort in
                            
                            SortTag(selectedSort: $sortModel.selectedSort, sort: sort)
                            
                        }
                    }
                    .padding(.top)
                    .padding(.bottom)
                    .padding(.leading)
                    
                }
                
            }
        }
    }
}

struct SortButton_Previews: PreviewProvider {
    static var previews: some View {
        SortButton()
    }
}
