//
//  CallButton.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/8/23.
//

import SwiftUI

struct CallButton: View {
    
    var business : Business
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        
        
        
        VStack {
            Button {
                
                openURL(URL(string: "tel:\(business.phone ?? "")")!)

            } label: {
                ZStack {
                    VStack {
                        Image(systemName: "phone.connection")
                        
                        Text("Call")
                            .padding(.top, 5)
                           
                    }
                }
            }
        
            .foregroundColor(Color.theme.secondaryText)
        }
    }
}

