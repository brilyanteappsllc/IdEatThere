//
//  HostButton.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/9/23.
//

import SwiftUI

struct HostButton: View {
    var body: some View {
        
        
        ZStack {
            
            Rectangle()
                .frame(height: 125)
                .cornerRadius(10)
                .foregroundColor(Color.theme.groupButtonColor)
                .padding(.horizontal)
            
            VStack {
                
                Image(systemName: "plus")
                    .padding(.bottom, 3)
                    .font(.system(size: 20))
                Text("Host a Group")
                    .foregroundColor(Color.theme.blackText)
            }
            
        
        }
        
        
    }
}

struct HostButton_Previews: PreviewProvider {
    static var previews: some View {
        HostButton()
    }
}
