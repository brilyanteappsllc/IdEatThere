//
//  FilterButton.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/5/23.
//

import SwiftUI

struct FilterButton: View {
    
    @EnvironmentObject var filterModel : ContentModel
    
    @State var isFilterShowing = false
    
    var body: some View {
        
        VStack{
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                // 3
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(filterModel.selection) { item in
                            FilterTag(filterData: item)
                        }
                    }
                }
                Spacer()
                Button(action: { filterModel.clearSelection() }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color.black.opacity(0.6))
                }
            }
            .padding(6)
            .background(RoundedRectangle(cornerRadius: 8).foregroundColor(Color.gray.opacity(0.5)))
            
            ZStack {
                Rectangle()
                    .frame(width: 150, height: 20)
                    .opacity(0)
                HStack {
                    Text(isFilterShowing ? "Collapse Filters" : " Show Filter Options")
                    ChevronDownButton(iconName: "chevron.down", height: 15, width: 15)
                        .rotationEffect(Angle(degrees: isFilterShowing ? 180 : 0))
                        .onTapGesture {
                            withAnimation(.spring()) {
                                isFilterShowing.toggle()
                            }
                        }
                }
            }
            
            if isFilterShowing {
                List {
                    ForEach(0..<filterModel.filterTagData.count) { index in
                        FilterTag(filterData: filterModel.filterTagData[index])
                            .onTapGesture {
                                filterModel.toggleFilter(at: index)
                            }
                    }
                }
            }
            
            else {
                
            }
        }
    }
    
}

struct FilterButton_Previews: PreviewProvider {
    static var previews: some View {
        FilterButton()
            .environmentObject(ContentModel())
    }
}
