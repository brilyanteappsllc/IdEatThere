//
//  AddToMyGroupButton.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/8/23.
//

import SwiftUI

struct AddToMyGroupButton: View {
    
    @State private var animateButton : Bool = false
    @State private var isAddedToMyGroup : Bool = false
    @State private var testFalse : Bool = false
    @State private var showMyGroupsView : Bool = false // new sheet to add restaurant to my groups list
    
    
    var body: some View {
        
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
    }
}

struct AddToMyGroupButton_Previews: PreviewProvider {
    static var previews: some View {
        AddToMyGroupButton()
    }
}
