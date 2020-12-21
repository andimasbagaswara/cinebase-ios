//
//  MovieDetailScreen.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 21/12/20.
//

import SwiftUI

struct MovieDetailScreen: View {
    
    let movieDetailVM: MovieDetailViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            ZStack {
                URLImage(url: movieDetailVM.posterPath)
                    .aspectRatio(contentMode: .fill)
                
                Rectangle()
                    .foregroundColor(.clear)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.white]), startPoint: .top, endPoint: .bottom))
            }
            
            HStack(alignment: .top, spacing: nil, content: {
                VStack(alignment: .leading, spacing: nil, content: {
                    Text(movieDetailVM.title)
                        .font(.customTitle)
                    Text(movieDetailVM.genres)
                        .font(.customTitle2)
                        .foregroundColor(.gray)
                    Text(movieDetailVM.spokenLanguage)
                        .font(.customHeading)
                        .foregroundColor(.gray)
                    
                })
                Spacer()
                VStack(alignment: .center, spacing: nil, content: {
                    HStack(alignment: .center, spacing: nil, content: {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("\(movieDetailVM.voteAverage, specifier: "%.1f")/10")
                            .font(.customHeading)
                            .foregroundColor(.gray)
                    })
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Text("SAVE")
                    })
                    .buttonStyle(CustomButtonStyle(isSelected: false))
                })
            })
            .padding()
            
            Divider()
                .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 10, content: {
                Text("''\(movieDetailVM.tagline)''")
                    .font(.customTitle2)
                Text("Storyline")
                    .font(.customTitle2)
                Text(movieDetailVM.overview)
                    .font(.customHeading)
                HStack(alignment: .center, spacing: nil, content: {
                    Text("Release Date:")
                    Text(movieDetailVM.releaseDate)
                })
                .font(.customHeading)
                HStack(alignment: .center, spacing: nil, content: {
                    Text("Runtime:")
                    Text("\(movieDetailVM.runtime) minutes")
                })
                .font(.customHeading)
            })
            .foregroundColor(.gray)
            .padding()
        })
        .edgesIgnoringSafeArea(.top)
    }
}

struct MovieDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailScreen(movieDetailVM: MovieDetailViewModel(movieDetail: Constants.movieDetailPreviewData))
    }
}
