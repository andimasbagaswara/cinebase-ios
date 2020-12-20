//
//  LibraryView.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 19/12/20.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            Text("Placeholder")
                .navigationTitle("Library")
        })
        .embedNavigationView()
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
