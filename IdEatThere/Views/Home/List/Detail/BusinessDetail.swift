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
    @State private var animateButton : Bool = false
    @State private var isAddedToMyGroup : Bool = false
    @State private var testFalse : Bool = false
    @State private var showMyGroupsView : Bool = false // new sheet to add restaurant to my groups list
    
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
                            .opacity(0)
                    
                    HStack {
                        Text(business.isClosed! ? "Closed..." : "Open!")
                            .foregroundColor(.white)
                            .bold()
                            .padding(.leading)
                        
                        Spacer()
                        YelpAttribution(link: business.url!)
                    }
                }
                
            }
            
            Group {
                
                // BusinessTitle View
                HStack {
                    BusinessTitle(business: business)
                        .padding()
                    
                }
                
                
                DashedDivider()
                    .padding(.horizontal)
                
                // - Phone -
                HStack {
                    Text("Phone: ")
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
                    Text("Reviews: ")
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
                    Text("View in Yelp: ")
                        .bold()
                        
                    Spacer()
                    YelpAttribution(link: business.url!)
                
                }
                .padding()
                
                
                DashedDivider()
                    .padding(.horizontal)
                
            
            } // End of Group
            
            
            // - Button to get directions -
            HStack {
                Button {
                    showDirections.toggle()
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 48)
                            .opacity(0)
                        HStack {
                            Text("Get Directions")
                                .foregroundColor(.white)
                                .bold()
                            CircleButton(iconName: "map.circle.fill", height: 15, width: 15, addToMyGroup: $testFalse)
                        }
                    }
                }
                .padding()
                .sheet(isPresented: $showDirections) {
                    DirectionsView(business: business)
                }
                
                Button {
                    self.isAddedToMyGroup.toggle()
                    self.animateButton.toggle()
                    showMyGroupsView.toggle()
                } label: {
                    ZStack {
                        Rectangle()
                            .opacity(0)
                        HStack {
                            Text(isAddedToMyGroup ? "Added to My Group!" : "Add to My Group!")
                                .foregroundColor(Color.theme.accent)
                                .bold()
                            CircleButton(iconName: "heart.fill", height: 15, width: 15, addToMyGroup: $isAddedToMyGroup)
                                .background(
                                    CircleButtonAnimation(animate: $animateButton)
                                    )
                        }
                    }
                }
                .padding()
                .sheet(isPresented: $showMyGroupsView, content: {
                    MyGroupsView()
                        .environmentObject(business)
                })
            }
        } // End of VStack
        
    }
}
