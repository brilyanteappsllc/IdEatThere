//
//  FilterButton.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/5/23.
//

import SwiftUI

struct FilterButton: View {
    
    @EnvironmentObject var filterModel : RestaurantsContentModel
    
    @State var isFilterShowing = false
    @State var selectedFilter = false
    @Binding var searchText : String
    @Binding var filterOptions : RestaurantsContentModel.filterOption
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Group {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(
                            selectedFilter || !searchText.isEmpty ?
                            Color.theme.accent : Color.theme.secondaryText
                        )
                    
                    TextField("Search...", text: $searchText)
                        .foregroundColor(Color.theme.accent)
                    //                    .disableAutocorrection(true)
                    
                    //                ScrollView(.horizontal, showsIndicators: false) {
                    //                    HStack {
                    //                        ForEach(filterModel.selection) { item in
                    //                            FilterTag(filterData: item)
                    //                        }
                    //                    }
                    
                    Spacer()
                    Button(action: {
                        filterModel.clearSelection()
                        self.selectedFilter = false
                        self.searchText = ""
                        self.filterOptions = .none
                        UIApplication.shared.endEditing()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .padding(3)
                            .foregroundColor(
                                selectedFilter || !searchText.isEmpty ?
                                Color.theme.accent : Color.theme.secondaryText)
                    }
                }
                
            }
            .font(.headline)
            .padding(6)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.theme.background)
                    .shadow(
                        color: Color.theme.accent,
                        radius: 5, x: 0, y: 0)
            )
            
            Group {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(FoodCategory.allCases, id: \.self) { category in
                            
                            FilterTag(selectedCategory: $filterModel.selectedCategory, category: category)
                            
                        }
                    }
                    .padding(.top)
                    .padding(.bottom)
                    
                }

        }
                
 //               ScrollView(.horizontal, showsIndicators: false) {
                    
                    
                    
//                    ForEach(0..<filterModel.filterTagData.count) { index in
//                        FilterTag(filterData: filterModel.filterTagData[index])
//                            .onTapGesture {
//                                filterModel.toggleFilter(at: index)
//                                self.selectedFilter = true
//                                self.filterOptions = filterModel.filterTagData[index].filter
//                            }
//                    }
                    
              //  }
                    
                
//                HStack {
//                    Text(isFilterShowing ? "Collapse Filters" : " Show Filter Options")
//                    ChevronDownButton(iconName: "chevron.down", height: 15, width: 15)
//                        .rotationEffect(Angle(degrees: isFilterShowing ? 180 : 0))
//                        .onTapGesture {
//                            withAnimation(.spring()) {
//                                isFilterShowing.toggle()
//                            }
//                        }
//                }
        //}
            
//            if isFilterShowing {
//                List {
//                    ForEach(0..<filterModel.filterTagData.count) { index in
//                        FilterTag(filterData: filterModel.filterTagData[index])
//                            .onTapGesture {
//                                filterModel.toggleFilter(at: index)
//                                self.selectedFilter = true
//                                self.filterOptions = filterModel.filterTagData[index].filter
//                            }
//                    }
//                }
//            }
        }
    }
    
}

//struct FilterButton_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterButton(searchText: .constant(""), selectedCategory: .constant(""))
//            .environmentObject(ContentModel())
//    }
//}
