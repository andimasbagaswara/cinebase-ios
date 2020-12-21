//
//  LibraryScreen.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 21/12/20.
//

import SwiftUI

struct LibraryScreen: View {
    
    @ObservedObject private var libraryVM = LibraryViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: nil, content: {
            if libraryVM.loadingState == .loading {
                ProgressView()
            } else if libraryVM.loadingState == .success {
                LibraryView(libraryVM: libraryVM)
            } else if libraryVM.loadingState == .failed {
                Text("Error Occurred")
                    .font(.customTitle2)
                    .foregroundColor(.gray)
            }
        })
        .onAppear {
            self.libraryVM.fetchAllItems()
        }
    }
}

struct LibraryScreen_Previews: PreviewProvider {
    static var previews: some View {
        LibraryScreen()
    }
}
