//
//  FilterAndSortButton.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 4/18/23.
//

import SwiftUI

struct FilterAndSortButton: View {
    
    @State private var animateButton : Bool = false
    @State private var showFilterAndSortView : Bool = false
    
    
    var body: some View {
            

                
                Button {
                    self.showFilterAndSortView = true
                } label: {
                    HStack {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.black)
                        Text("Options")
                            .foregroundColor(.black)
                    }
                    
                }
                .padding(.leading)
                .padding(.bottom)
            .sheet(isPresented: $showFilterAndSortView) {
                FilterAndSortView(showFilterAndSortView: $showFilterAndSortView)
            }
        
    }
}

struct FilterAndSortButton_Previews: PreviewProvider {
    static var previews: some View {
        FilterAndSortButton()
    }
}
