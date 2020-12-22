//
//  DiscoverBannerScrollView.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 20/12/20.
//

import SwiftUI

struct DiscoverBannerScrollView: View {
    
    let movieVM: [MovieViewModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(alignment: .center, spacing: nil, content: {
                ForEach(self.movieVM, id: \.id) { (movieVM) in
                    NavigationLink(
                        destination: MovieDetailScreen(id: movieVM.id),
                        label: {
                            TabCardView(movieVM: movieVM)
                        })
                }
            })
            .padding(.horizontal)
        })
        .frame(height: Constants.heightRatio * 190, alignment: .center)
    }
}

struct TabCardView: View {
    
    let movieVM: MovieViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: nil, content: {
            URLImage(url: movieVM.backdropPath)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(10)
                .frame(width: Constants.widthRatio * 350, alignment: .center)
        })
    }
}

struct DiscoverTabView_Previews: PreviewProvider {
    static var previews: some View {
        let movieVM: [MovieViewModel] = Constants.moviePreviewData.map(MovieViewModel.init)
        DiscoverBannerScrollView(movieVM: movieVM)
        
    }
}
