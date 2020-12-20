//
//  NavigationBarModifier.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 19/12/20.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {
    
    init() {
        let appearance = UINavigationBarAppearance()
        
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    func body(content: Content) -> some View {
        content
    }
}
