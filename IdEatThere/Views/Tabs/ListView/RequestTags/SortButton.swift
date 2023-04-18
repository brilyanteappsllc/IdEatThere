//
//  SortButton.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 4/17/23.
//

import SwiftUI

struct SortButton: View {
    
    @EnvironmentObject var sortModel : RestaurantsContentModel
    
    @State var isSortShowing = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            //            Group {
            //                SearchBar(searchText: $filterModel.searchText)
            //                    .padding(.horizontal)
            //            }
            
            Group {
                HStack {
                    Text(isSortShowing ? "Collapse Sort Options" : " Show Sort Options")
                    ChevronDownButton(iconName: "chevron.down", height: 15, width: 15)
                        .rotationEffect(Angle(degrees: isSortShowing ? 180 : 0))
                        .onTapGesture {
                            withAnimation(.spring()) {
                                isSortShowing.toggle()
                            }
                        }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    if isSortShowing {
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
}

struct SortButton_Previews: PreviewProvider {
    static var previews: some View {
        SortButton()
    }
}
