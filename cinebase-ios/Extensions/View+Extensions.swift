//
//  View+Extensions.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 19/12/20.
//

import SwiftUI

extension View {
    
    func embedNavigationView() -> some View {
        return NavigationView { self }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
