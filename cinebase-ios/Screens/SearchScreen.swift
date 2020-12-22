//
//  SearchScreen.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 22/12/20.
//

import SwiftUI

struct SearchScreen: View {
    
    @ObservedObject private var searchVM = SearchViewModel()
    @State private var movieName: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: nil, content: {
            
            TextField("Search", text: $movieName, onEditingChanged: { _ in }, onCommit: {
                self.searchVM.searchByName(self.movieName)
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
            
            if self.searchVM.loadingState == .loading {
                ProgressView()
                Spacer()
            } else if self.searchVM.loadingState == .success {
                SearchView(movieVM: searchVM.movieList)
            } else if self.searchVM.loadingState == .failed {
                Text("404 - Not Found")
                    .font(.customTitle2)
                    .foregroundColor(.gray)
                Spacer()
            }
        })
        .padding()
        .navigationBarTitle("Search")
        .embedNavigationView()
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
