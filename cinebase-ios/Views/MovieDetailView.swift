//
//  MovieDetailView.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 21/12/20.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movieDetailVM: MovieDetailViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            ZStack {
                URLImage(url: movieDetailVM.posterPath)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, alignment: .center)
                    .clipped()
                
                Rectangle()
                    .foregroundColor(.clear)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.white]), startPoint: .top, endPoint: .bottom))
            }
            
            HStack(alignment: .center, spacing: nil, content: {
                Text(movieDetailVM.title)
                    .font(.customTitle)
                Spacer()
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("\(movieDetailVM.voteAverage, specifier: "%.1f")/10")
                    .font(.customHeading)
                    .foregroundColor(.gray)
            })
            .padding(.horizontal)
            
            HStack(alignment: .center, spacing: nil, content: {
                Text("\(movieDetailVM.genres) - \(movieDetailVM.spokenLanguage)")
                    .font(.customBody)
                    .foregroundColor(.gray)
                Spacer()
                SaveButton(movieDetailVM: movieDetailVM)
            })
            .padding()
            
            Divider()
                .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: Constants.heightRatio * 10, content: {
                Text("''\(movieDetailVM.tagline)''")
                    .font(.customTitle2)
                Text("Storyline")
                    .font(.customHeading)
                Text(movieDetailVM.overview)
                    .font(.customBody)
                Text("Release Date:")
                    .font(.customHeading)
                Text(movieDetailVM.releaseDate)
                    .font(.customBody)
                Text("Runtime:")
                    .font(.customHeading)
                Text("\(movieDetailVM.runtime) minutes")
                    .font(.customBody)
            })
            .foregroundColor(.gray)
            .padding()
            
            if !self.movieDetailVM.reviewList.isEmpty {
                Divider()
                    .padding(.horizontal)
                
                ReviewSectionView(reviewVM: self.movieDetailVM.reviewList)
            }
        })
        .edgesIgnoringSafeArea(.top)
    }
}

struct SaveButton: View {
    
    let movieDetailVM: MovieDetailViewModel
    
    @State var isSaved: Bool = false
    
    var body: some View {
        Button(action: {
            self.isSaved ? self.movieDetailVM.deleteItem() : self.movieDetailVM.saveItem()
            self.isSaved.toggle()
        }, label: {
            self.isSaved ? Text("SAVED") : Text("SAVE")
        })
        .buttonStyle(CustomButtonStyle(isSelected: !self.movieDetailVM.checkItem()))
        .onAppear(perform: {
            self.isSaved = self.movieDetailVM.checkItem()
        })
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieDetailVM: MovieDetailViewModel(movieDetail: Constants.movieDetailPreviewData))
    }
}
