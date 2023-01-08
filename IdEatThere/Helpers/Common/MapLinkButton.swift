//
//  MapLinkButton.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/8/23.
//

import SwiftUI

struct MapLinkButton: View {
    
    var business : Business
    
    @State var showDirections = false
    
    var body: some View {
        
        VStack {
            Button {
                showDirections.toggle()
            } label: {
                ZStack {
                    VStack {
                        Image(systemName: "map.circle.fill")

                        Text("Map")
                            .padding(.top, 5)
                            
                    }
                }
            }
            .foregroundColor(Color.theme.secondaryText)
            .sheet(isPresented: $showDirections) {
                DirectionsView(business: business)
                   
            }
        }
    }
}

