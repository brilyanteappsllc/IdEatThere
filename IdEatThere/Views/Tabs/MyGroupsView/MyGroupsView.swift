//
//  MyGroupsView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/3/23.
//

import SwiftUI

struct MyGroupsView: View {
    
    @EnvironmentObject var myGroupsModel : MyGroupsModel
    
    
    var flexiblecolumns = Array(repeating: GridItem(.flexible(minimum: 0),
                                                    spacing: 5,
                                                    alignment: .center), count: 3)
    
    
    
    var body: some View {
        
        if myGroupsModel.hasGroups == true {
            
            NavigationView {
                
                ZStack(alignment: .top) {
                    
                    VStack {
                        
                        Group{
                            VStack(alignment: .leading) {
                                
                                Text("My Groups")
                                    .padding(.leading)
                                    .padding(.top, 50)
                                
                                HostButton()
                            }
                            
                        }
                        
                        Group{
                            
                            VStack(alignment: .leading) {
                                
                                Text("Groups I'm In")
                                    .padding(.top, 25)
                                    .padding(.leading)
                                
                                ScrollView(showsIndicators: true) {
                                    
                                    LazyVGrid(columns: flexiblecolumns) {
                                
                                        ForEach(0..<10) {index in
                                            Text("PlaceHolder\(index)")
                                            
                                        }
                                        
                                    }
                                }
                            }
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        
                        ToolbarItem(placement: .navigationBarLeading) {
                            HStack {
                                Image(systemName: "fork.knife.circle.fill")
                                    .font(.system(size: 25))
                              Text("I'd Eat There")
                                    .font(.system(size: 30))
                            }
                            .padding(.top, 10)
                        }
                        
                        
                    }
                }
            }
        }
        
        else {
            
            ZStack {
                
                NavigationView {
                    
                    
                    NoGroupsYet()
                    
                        .navigationTitle("")
                    //      .font(Font.headingFont)
                    //  .foregroundColor(Color.theme.accent)
                }
            }
        }
    }
}

struct MyGroupsView_Previews: PreviewProvider {
    static var previews: some View {
        MyGroupsView()
            .environmentObject(MyGroupsModel())
    }
}
