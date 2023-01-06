//
//  Color.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/5/23.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
    
}

struct ColorTheme {
    
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
    let blackText = Color("BlackTextColor")
    let gold = Color("GoldColor")
    

    
    func tabBarAppearance(appearance: String) -> UITabBarAppearance {
        
        switch appearance {
            
        case "Standard" :
            
            let standardApperance = UITabBarAppearance()
            standardApperance.configureWithDefaultBackground()
            standardApperance.backgroundColor = UIColor(Color.theme.background)
            standardApperance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(Color.theme.green)]
            standardApperance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(Color.theme.red)]
            standardApperance.stackedLayoutAppearance.normal.iconColor = UIColor(Color.theme.green)
            standardApperance.stackedLayoutAppearance.selected.iconColor = UIColor(Color.theme.red)
            UITabBar.appearance().standardAppearance = standardApperance
            let tab = UITabBar.appearance().standardAppearance
            
            return tab
            
            
        case "ScrollEdge" :
            let scrollEdgeAppearance = UITabBarAppearance()
            scrollEdgeAppearance.configureWithTransparentBackground()
            scrollEdgeAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(Color.theme.green)]
            scrollEdgeAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(Color.theme.red)]
            scrollEdgeAppearance.stackedLayoutAppearance.normal.iconColor = UIColor(Color.theme.green)
            scrollEdgeAppearance.stackedLayoutAppearance.selected.iconColor = UIColor(Color.theme.red)
            UITabBar.appearance().scrollEdgeAppearance = scrollEdgeAppearance
            let tab = UITabBar.appearance().scrollEdgeAppearance
            
            return tab!
            
        default :
            
            return UITabBarAppearance()
            
        }
    }
    
}


