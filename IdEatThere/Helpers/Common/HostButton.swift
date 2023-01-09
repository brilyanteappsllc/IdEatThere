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
                .frame(width: 200, height: 50)
                .cornerRadius(20)
                .foregroundColor(Color.theme.accent)
            
            Text("Start a group!")
                .foregroundColor(Color.theme.blackText)
            
            
        
        }
        
        
    }
}

struct HostButton_Previews: PreviewProvider {
    static var previews: some View {
        HostButton()
    }
}
