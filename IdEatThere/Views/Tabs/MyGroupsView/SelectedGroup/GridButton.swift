//
//  GridButton.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 2/16/23.
//

import SwiftUI

struct GridButton: View {
    
    @EnvironmentObject var myGroupsModel: MyGroupsModel
    
    var group : Groups
    var viewAsHost : Bool
    
    var body: some View {
        
        
        
        
        VStack(alignment: .leading, spacing: 5) {


                HStack {
                    
                    Rectangle()
                        .frame(width: 75, height: 75)
                        .cornerRadius(10)
                        .padding(5)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        
                        Text(group.groupName ?? "")
                            .font(.bodyHeaderFont)
                            .foregroundColor(Color.theme.secondaryText)
                        
                        Text(group.date ?? Date(), formatter: myGroupsModel.dateFormatter)
                            .font(.bodyFont)
                        
//                        Text(group.groupType ?? "")
//                            .font(.bodyFont)
//                            .foregroundColor(Color.theme.secondaryText)
                    }
                    
                    Spacer()
                    
                }
                .padding(5)
                .background(.white)
                .cornerRadius(15)
                .shadow(radius: 0.5)


        }
        .padding(.horizontal)
    }
}

//struct GridButton_Previews: PreviewProvider {
//    static var previews: some View {
//        GridButton()
//    }
//}
