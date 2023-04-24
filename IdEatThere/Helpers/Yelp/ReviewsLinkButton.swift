//
//  ReviewsLinkButton.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/8/23.
//

import SwiftUI

struct ReviewsLinkButton: View {
    
    var business : Business
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        
        VStack {
            Button {
                
                openURL(URL(string: "\(business.url ?? "")")!)

            } label: {
                ZStack {
                    VStack {
                        Image(systemName: "rectangle.and.pencil.and.ellipsis")
                        
                        Text("Reviews")
                            .padding(.top, 5)
                           
                    }
                }
            }
            .foregroundColor(Color.theme.secondaryText)
    }
    }
}
