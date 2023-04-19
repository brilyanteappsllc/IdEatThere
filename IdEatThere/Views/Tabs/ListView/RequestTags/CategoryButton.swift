//
//  CategoryButton.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 4/17/23.
//

import SwiftUI

struct CategoryButton: View {
    
    @EnvironmentObject var categoryModel : RestaurantsContentModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            //            Group {
            //                SearchBar(searchText: $filterModel.searchText)
            //                    .padding(.horizontal)
            //            }
            
            Group {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(FoodCategory.allCases, id: \.self) { category in
                            
                            CategoryTag(selectedCategory: $categoryModel.selectedCategory, category: category)
                            
                        }
                    }
                    .padding(.top)
                    .padding(.bottom)
                    .padding(.leading)
                    
                }
                
            }
        }
        .safeAreaInset(edge: .trailing) {
            Rectangle()
                .fill(LinearGradient(colors: [.white, .white.opacity(0)], startPoint: .trailing, endPoint: .leading))
                .frame(width: 20)
                .frame(height: 20)
        }
        .edgesIgnoringSafeArea(.trailing)
    }
}

struct CategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButton()
    }
}