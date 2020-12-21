//
//  DashboardScreen.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 19/12/20.
//

import SwiftUI

struct DashboardScreen: View {
    var body: some View {
        TabView(selection: .constant(1),
                content:  {
                    DiscoverView().tabItem {
                        Image(systemName: "tv")
                        Text("Discover")
                    }.tag(1)
                    LibraryScreen().tabItem {
                        Image(systemName: "rectangle.3.offgrid")
                        Text("Library")
                    }.tag(2)
                    ProfileView().tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }.tag(3)
                })
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
