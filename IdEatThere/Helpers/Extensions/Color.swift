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
    let tabSelectedItemColor = Color("TabSelectedItemColor")
    let tabUnselectedItemColor = Color("TabUnselectedItemColor")

    
    func tabBarAppearance(appearance: String) -> UITabBarAppearance {
        
        switch appearance {
            
        case "Standard" :
            
            let standardApperance = UITabBarAppearance()
            standardApperance.configureWithDefaultBackground()
            standardApperance.backgroundColor = UIColor(Color.theme.background)
            standardApperance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(Color.theme.tabUnselectedItemColor)]
            standardApperance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(Color.theme.tabSelectedItemColor)]
            standardApperance.stackedLayoutAppearance.normal.iconColor = UIColor(Color.theme.tabUnselectedItemColor)
            standardApperance.stackedLayoutAppearance.selected.iconColor = UIColor(Color.theme.tabSelectedItemColor)
            UITabBar.appearance().standardAppearance = standardApperance
            let tab = UITabBar.appearance().standardAppearance
            
            return tab
            
            
        case "ScrollEdge" :
            let scrollEdgeAppearance = UITabBarAppearance()
            scrollEdgeAppearance.configureWithTransparentBackground()
            scrollEdgeAppearance.backgroundColor = UIColor(Color.theme.background)
            scrollEdgeAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(Color.theme.tabUnselectedItemColor)]
            scrollEdgeAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(Color.theme.tabSelectedItemColor)]
            scrollEdgeAppearance.stackedLayoutAppearance.normal.iconColor = UIColor(Color.theme.tabUnselectedItemColor)
            scrollEdgeAppearance.stackedLayoutAppearance.selected.iconColor = UIColor(Color.theme.tabSelectedItemColor)
            UITabBar.appearance().scrollEdgeAppearance = scrollEdgeAppearance
            let tab = UITabBar.appearance().scrollEdgeAppearance
            
            return tab!
            
        default :
            
            return UITabBarAppearance()
            
        }
    }
    
}


