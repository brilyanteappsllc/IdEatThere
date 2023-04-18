//
//  FilterAndSortView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 4/18/23.
//

import SwiftUI

struct FilterAndSortView: View {
    
    @EnvironmentObject var filterAndSortModel : RestaurantsContentModel
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var showFilterAndSortView : Bool
    
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                
                Group {
                    
                    Text("Attributes")
                        .bold()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        
                        VStack {
                            ForEach(AttributeOptions.allCases, id: \.self) { attribute in
                                
                                AttributeTag(selectedAttribute: $filterAndSortModel.selectedAttribute, attribute: attribute)
                                
                            }
                        }
                        .padding()
                        
                    }
                    
                }
                
                DashedDivider()
                
                Group {
                    
                    
                    
                    Text("Sort")
                        .bold()
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack {
                            ForEach(SortOptions.allCases, id: \.self) { sort in
                                
                                SortTag(selectedSort: $filterAndSortModel.selectedSort, sort: sort)
                                
                            }
                        }
                        .padding()
                        
                    }
                }
            }
            .padding(.leading)
            .navigationTitle("Filters")
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button {
                            self.showFilterAndSortView = false
                    } label: {
                        Text("Exit")
                            .bold()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("test")
                    } label: {
                        Text("Apply")
                    }
                }
            }
        }
    }
}

//struct FilterAndSortView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterAndSortView()
//    }
//}
