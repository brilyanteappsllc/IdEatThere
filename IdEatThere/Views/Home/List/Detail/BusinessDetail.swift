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
                
            }
            
            Group {
                
                // BusinessTitle View
                HStack {
                    BusinessTitle(business: business)
                        .padding(.leading)
                    
                }
                
                Text(business.isClosed! ? "Closed..." : "Open!")
                    .foregroundColor(business.isClosed! ? Color.theme.red : Color.theme.green)
                    .padding(.leading)
                
                
                DashedDivider()
                    .padding(.horizontal)
                
                // - Phone -
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: "phone.connection")
                        Link("Call", destination: URL(string: "tel:\(business.phone ?? "")")!)
                    }
                    Spacer()
                    VStack {
                        Image(systemName: "rectangle.and.pencil.and.ellipsis")
                        Link("Reviews", destination: URL(string: "\(business.url ?? "")")!)
                    }
                    Spacer()
                    VStack {
                        Button {
                            showDirections.toggle()
                        } label: {
                            ZStack {
                                VStack {
                                    Image(systemName: "map.circle.fill")
                                    Text("Map")
                                }
                            }
                        }
                        .sheet(isPresented: $showDirections) {
                            DirectionsView(business: business)
                        }
                    }
                    Spacer()
                    VStack {
                        YelpAttribution(link: business.url!)
                    }
                    Spacer()
                }
                .padding()
                
                DashedDivider()
                    .padding(.horizontal)
                
                Button {
                    self.isAddedToMyGroup.toggle()
                    self.animateButton.toggle()
  //                  showMyGroupsView.toggle()
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
//                .sheet(isPresented: $showMyGroupsView, content: {
//                    MyGroupsView()
//                        .environmentObject(business)
//                })
            }
        } // End of VStack
        
    }
}
