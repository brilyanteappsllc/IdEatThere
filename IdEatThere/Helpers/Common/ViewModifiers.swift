//
//  ViewModifiers.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 5/15/23.
//

import Foundation
import SwiftUI


/// https://stackoverflow.com/questions/57254461/how-to-change-the-background-color-for-a-form-in-swiftui

struct FormHiddenBackground: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content.scrollContentBackground(.hidden)
        } else {
            content.onAppear {
                UITableView.appearance().backgroundColor = .clear
            }
            .onDisappear {
                UITableView.appearance().backgroundColor = .systemGroupedBackground
            }
        }
    }
}
