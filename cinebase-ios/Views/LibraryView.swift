//
//  LibraryView.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 19/12/20.
//

import SwiftUI

struct LibraryView: View {
    
    @ObservedObject private var libraryVM = LibraryViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            List(content: {
                ForEach(self.libraryVM.items, id: \.id) { (item) in
                    URLImage(url: item.backdropPath)
                }
            })
        })
        .onAppear(perform: {
            self.libraryVM.fetchAllItems()
        })
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
