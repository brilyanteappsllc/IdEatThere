//
//  BusinessDetail.swift
//  CitySightsApp
//
//  Created by Brilyante Apps LLC on 1/20/22.
//

import SwiftUI

struct BusinessDetail: View {
    
    var business: Business
    @State var showDirections = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            VStack (alignment: .leading) {
                
                // - Image -
                GeometryReader() { geometry in
                
                    let uiImage = UIImage(data: business.imageData ?? Data())
                    Image(uiImage: uiImage ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                    
                }
                .ignoresSafeArea(.all, edges: .top)

                
                // - Open or closed status -
                ZStack (alignment: .leading) {
                    Rectangle()
                        .frame(height: 36)
                        .foregroundColor(business.isClosed! ? .gray : .blue)
                    
                    Text(business.isClosed! ? "Closed" : "Open")
                        .foregroundColor(.white)
                        .bold()
                        .padding(.leading)
                }
                
            }
            
            Group {
                
                // BusinessTitle View
                HStack {
                    BusinessTitle(business: business)
                        .padding()
                    
                    Spacer()
                    YelpAttribution(link: business.url!)
                    
                }
                
                
                DashedDivider()
                    .padding(.horizontal)
                
                // - Phone -
                HStack {
                    Text("Phone")
                        .bold()
                    Text(business.phone ?? "")
                    Spacer()
                    Link("Call", destination: URL(string: "tel:\(business.phone ?? "")")!)
                
                }
                .padding()
                
                DashedDivider()
                    .padding(.horizontal)
                
                // - Review count and read -
                HStack {
                    Text("Reviews")
                        .bold()
                    Text("\(business.reviewCount ?? 0)")
                    Spacer()
                    Link("Read", destination: URL(string: "\(business.url ?? "")")!)
                
                }
                .padding()
                
                
                DashedDivider()
                    .padding(.horizontal)
                
                // - Website -
                HStack {
                    Text("Website:")
                        .bold()
                    Text(business.url ?? "")
                        .lineLimit(1)
                    Spacer()
                    Link("Visit", destination: URL(string: "\(business.url ?? "")")!)
                
                }
                .padding()
                
                
                DashedDivider()
                    .padding(.horizontal)
                
            
            } // End of Group
            
            
            // - Button to get directions -
            Button {
                showDirections = true
            } label: {
                ZStack {
                    Rectangle()
                        .frame(height: 48)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                    
                    Text("Get Directions")
                        .foregroundColor(.white)
                        .bold()
                
                }
            }
            .padding()
            .sheet(isPresented: $showDirections) {
                DirectionsView(business: business)
            }

            
        } // End of VStack
        
    }
}
