//
//  MovieDetailScreen.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 21/12/20.
//

import SwiftUI

struct MovieDetailScreen: View {
    
    let id: Int
    @ObservedObject var movieDetailVM = MovieDetailViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: nil, content: {
            if movieDetailVM.loadingState == .loading {
                ProgressView()
            } else if movieDetailVM.loadingState == .success {
                MovieDetailView(movieDetailVM: movieDetailVM)
            } else if movieDetailVM.loadingState == .failed {
                Text("404 - Not Found")
                    .font(.customTitle2)
                    .foregroundColor(.gray)
            }
        })
        .onAppear {
            self.movieDetailVM.getMovieDetailById(id: id)
        }
    }
}

struct MovieDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailScreen(id: 550)
    }
}
