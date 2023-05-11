//
//  YelpAttribution.swift
//  I'd Eat There
//
//  Created by Brilyante Apps LLC on 1/3/23.
//
import SwiftUI

struct YelpAttribution: View {
    
    var link : String
    var height: CGFloat
    var width: CGFloat
    
    var body: some View {
        

            
        Link(destination: URL(string: link)!) {
                Image("yelp_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: height)
                    .frame(width: width)
            }
        
        
    }
}

//struct YelpAttribution_Previews: PreviewProvider {
//    static var previews: some View {
//        YelpAttribution(link: "test")
//    }
//}

