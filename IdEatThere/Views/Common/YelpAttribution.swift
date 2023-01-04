//
//  YelpAttribution.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//
import SwiftUI

struct YelpAttribution: View {
    
    var link : String
    
    var body: some View {
        
        
        Link(destination: URL(string: link)!) {
            Image("yelp")
                .resizable()
                .scaledToFit()
                .frame(height: 45)
        }
        
        
        
    }
}

