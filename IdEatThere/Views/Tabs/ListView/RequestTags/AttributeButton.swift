//
//  FilterButton.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/5/23.
//

import SwiftUI

struct AttributeButton: View {
    
    @EnvironmentObject var attributeModel : RestaurantsContentModel
    
    @State var isAttributesShowing = false
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
            //            Group {
            //                SearchBar(searchText: $filterModel.searchText)
            //                    .padding(.horizontal)
            //            }
            
            Group {
                
                HStack {
                    Text(isAttributesShowing ? "Collapse Attributes" : " Show Attribute Options")
                    ChevronDownButton(iconName: "chevron.down", height: 15, width: 15)
                        .rotationEffect(Angle(degrees: isAttributesShowing ? 180 : 0))
                        .onTapGesture {
                            withAnimation(.spring()) {
                                isAttributesShowing.toggle()
                            }
                        }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    if isAttributesShowing {
                        HStack {
                            ForEach(AttributeOptions.allCases, id: \.self) { attribute in
                                
                                AttributeTag(selectedAttribute: $attributeModel.selectedAttribute, attribute: attribute)
                                
                            }
                        }
                        .padding(.top)
                        .padding(.bottom)
                        .padding(.leading)
                        
                        
                    }
                }
                
            }
        }
        
//        VStack(alignment: .leading) {
//
//                        ScrollView(.horizontal, showsIndicators: false) {
//
//
//
//                            ForEach(0..<attributeModel.attributeTagData.count) { index in
//                                AttributeTag(attributeData: attributeModel.attributeTagData[index])
//                                    .onTapGesture {
//                                        attributeModel.toggleFilter(at: index)
//                                        self.selectedFilter = true
//                                        self.attributeOptions = attributeModel.attributeTagData[index].filter
//                                    }
//                            }
//
//                        }
//
//
//                        HStack {
//                            Text(isAttributesShowing ? "Collapse Filters" : " Show Filter Options")
//                            ChevronDownButton(iconName: "chevron.down", height: 15, width: 15)
//                                .rotationEffect(Angle(degrees: isAttributesShowing ? 180 : 0))
//                                .onTapGesture {
//                                    withAnimation(.spring()) {
//                                        isAttributesShowing.toggle()
//                                    }
//                                }
//                        }
//                }
//
//                    if isAttributesShowing {
//                        List {
//                            ForEach(0..<$attributeModel.attribute.count) { index in
//                                AttributeTag(attributeData: attributeModel.attributeTagData[index])
//                                    .onTapGesture {
//                                        attributeModel.toggleFilter(at: index)
//                                        self.selectedAttribute = true
//                                        self.attributeOptions = attributeModel.attributeTagData[index].filter
//                                    }
//                            }
//                        }
                    }
    
}

//struct FilterButton_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterButton(searchText: .constant(""), selectedCategory: .constant(""))
//            .environmentObject(ContentModel())
//    }
//}
