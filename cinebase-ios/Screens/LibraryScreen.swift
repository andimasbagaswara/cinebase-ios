//
//  LibraryScreen.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 21/12/20.
//

import SwiftUI

struct LibraryScreen: View {
    
    var body: some View {
        VStack(alignment: .center, spacing: nil, content: {
            LibraryView()
        })
        .navigationTitle("Library")
        .embedNavigationView()
    }
}

struct LibraryScreen_Previews: PreviewProvider {
    static var previews: some View {
        LibraryScreen()
    }
}
