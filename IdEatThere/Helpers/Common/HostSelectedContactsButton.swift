//
//  HostSelectedContactsButton.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 2/12/23.
//

import SwiftUI

struct HostSelectedContactsButton: View {
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .frame(width: 80, height: 45)
                .cornerRadius(10)
                .foregroundColor(Color.theme.groupButtonColor)
                .padding(.horizontal)

                Text("Host!")
                    .foregroundColor(Color.theme.blackText)
            
        }
        
    }
}

struct HostSelectedContactsButton_Previews: PreviewProvider {
    static var previews: some View {
        HostSelectedContactsButton()
    }
}
