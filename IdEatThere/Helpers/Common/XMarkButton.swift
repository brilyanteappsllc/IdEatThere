//
//  XMarkButton.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/6/23.
//

import SwiftUI

struct XMarkButton: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        
        Button(action: {
    //        UserManagerModel().userHasGroups = true
    //        dismiss()
        }, label: {
            VStack {
                Text( "Swipe down to exit ")
                Image(systemName: "chevron.down")
                    .font(.headline)

            }
        })
    }
}

//struct XMarkButton_Previews: PreviewProvider {
//    static var previews: some View {
//        XMarkButton()
//    }
//}
