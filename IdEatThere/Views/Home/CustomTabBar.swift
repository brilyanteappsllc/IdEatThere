//
//  CustomTabBar.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/9/23.
//

import SwiftUI

struct CustomTabBar: View {
    var body: some View {
        
        HStack(alignment: .center) {
            
            // -- My Groups --
            Button {
                
            } label: {
                
                GeometryReader {geo in
                    
                    Rectangle()
                        .foregroundColor(Color.theme.accent)
                        .frame(width: 50, height: 10)
                    
                    
                    VStack(alignment: .center, spacing: 4) {
                        
                        Image(systemName: "person.3")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 30)
                        Text("My Groups")
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                    
                }
                

            }
            
            // -- Eats --
            
            Button {
                
            } label: {
                
                GeometryReader {geo in
                    
                    Rectangle()
                        .foregroundColor(Color.theme.accent)
                        .frame(width: 50, height: 10)
                    
                    
                    
                    VStack {
                        
                        Image(systemName: "fork.knife")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        Text("Eats")
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            
            // -- My Profile --
            
            Button {
                
            } label: {
                
                GeometryReader {geo in
                    
                    Rectangle()
                        .foregroundColor(Color.theme.accent)
                        .frame(width: 50, height: 10)
                    
                    
                    
                    VStack {
                        
                        Image(systemName: "person.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        Text("My Profile")
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
                
        }
        
        
        
        
        
       
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}
