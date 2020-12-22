//
//  DiscoverSectionScrollView.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 20/12/20.
//

import SwiftUI

struct DiscoverSectionScrollView: View {
    
    let movieVM: [MovieViewModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(alignment: .center, spacing: Constants.widthRatio * 10, content: {
                ForEach(self.movieVM, id: \.id) { (movieVM) in
                    NavigationLink(
                        destination: MovieDetailScreen(id: movieVM.id),
                        label: {
                            DiscoverItemView(movieVM: movieVM)
                        })
                }
            })
            .padding(.horizontal)
        })
    }
}

struct DiscoverItemView: View {
    
    let movieVM: MovieViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: nil, content: {
            URLImage(url: movieVM.backdropPath)
                .aspectRatio(contentMode: .fill)
                .frame(width: Constants.heightRatio * 150, height: Constants.heightRatio * 150, alignment: .center)
                .clipped()
                .cornerRadius(10)
            Text(movieVM.title)
                .font(.customHeading)
                .foregroundColor(.gray)
                .lineLimit(1)
            Text("\(movieVM.genres)")
                .font(.customBody)
                .foregroundColor(.gray)
            HStack(alignment: .center, spacing: nil, content: {
                Image(systemName: "star.fill")
                    .font(.system(size: 10))
                    .foregroundColor(.yellow)
                Text("\(movieVM.voteAverage, specifier: "%.1f")")
                    .font(.customBody)
                    .foregroundColor(.gray)
            })
        })
        .frame(width: Constants.widthRatio * 150, alignment: .center)
    }
}

struct DiscoverSectionScrollView_Previews: PreviewProvider {
    static var previews: some View {
        let movieVM: [MovieViewModel] = Constants.moviePreviewData.map(MovieViewModel.init)
        DiscoverSectionScrollView(movieVM: movieVM)
    }
}
