//
//  SearchBar.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 4/15/23.
//

import SwiftUI

struct SearchBar: View {
    
    @EnvironmentObject var filterModel : RestaurantsContentModel
    
    @Binding var searchText : String
    
    var body: some View {

        
        HStack {
            Image(systemName: "magnifyingglass")
            
            TextField("Search...", text: $searchText)
                .foregroundColor(Color.theme.accent)
                                .disableAutocorrection(true)
            
            //                ScrollView(.horizontal, showsIndicators: false) {
            //                    HStack {
            //                        ForEach(filterModel.selection) { item in
            //                            FilterTag(filterData: item)
            //                        }
            //                    }
            
            Spacer()
            Button(action: {
//                filterModel.clearSelection()
                self.searchText = ""
//                self.filterOptions = .none
                UIApplication.shared.endEditing()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .padding(3)
                    .foregroundColor(Color.theme.accent)
            }
        }
        .font(.headline)
        .padding(6)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(
                    color: Color.theme.accent,
                    radius: 2, x: 0, y: 0)
        )
    }
}

//struct SearchBar_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBar()
//    }
//}



//HStack {
//    Image(systemName: "magnifyingglass")
//        .foregroundColor(
//            selectedFilter || !searchText.isEmpty ?
//            Color.theme.accent : Color.theme.secondaryText
//        )
//
//    TextField("Search...", text: $searchText)
//        .foregroundColor(Color.theme.accent)
//    //                    .disableAutocorrection(true)
//
//    //                ScrollView(.horizontal, showsIndicators: false) {
//    //                    HStack {
//    //                        ForEach(filterModel.selection) { item in
//    //                            FilterTag(filterData: item)
//    //                        }
//    //                    }
//
//    Spacer()
//    Button(action: {
//        filterModel.clearSelection()
//        self.selectedFilter = false
//        self.searchText = ""
//        self.filterOptions = .none
//        UIApplication.shared.endEditing()
//    }) {
//        Image(systemName: "xmark.circle.fill")
//            .padding(3)
//            .foregroundColor(
//                selectedFilter || !searchText.isEmpty ?
//                Color.theme.accent : Color.theme.secondaryText)
//    }
//}
