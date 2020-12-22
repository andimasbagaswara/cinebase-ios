//
//  SearchView.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 19/12/20.
//

import SwiftUI

struct SearchView: View {
    
    let movieVM: [MovieViewModel]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(self.movieVM, id: \.id) { (movieVM) in
                    NavigationLink(
                        destination: MovieDetailScreen(id: movieVM.id),
                        label: {
                            SearchItem(movieVM: movieVM)
                        })
                }
            }
        }
    }
}

struct SearchItem: View {
    
    let movieVM: MovieViewModel
    
    var body: some View {
        HStack(alignment: .top, spacing: nil, content: {
            URLImage(url: movieVM.backdropPath)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(10)
                .frame(width: Constants.heightRatio * 100, height: Constants.heightRatio * 100, alignment: .center)
                .clipped()
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: nil, content: {
                Text(movieVM.title)
                    .font(.customHeading)
                    .foregroundColor(.black)
                Text(movieVM.genres)
                    .font(.customBody)
                    .foregroundColor(.gray)
                HStack(alignment: .center, spacing: nil, content: {
                    Image(systemName: "star.fill")
                        .font(.system(size: 10))
                        .foregroundColor(.yellow)
                    Text("\(movieVM.voteAverage, specifier: "%.1f")/10")
                        .font(.customBody)
                        .foregroundColor(.gray)
                })
            })
            Spacer()
        })
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let movieVM: [MovieViewModel] = Constants.moviePreviewData.map(MovieViewModel.init)
        SearchView(movieVM: movieVM)
    }
}
