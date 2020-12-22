//
//  MovieViewModel.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 20/12/20.
//

import Foundation

struct MovieViewModel {
    
    let movie: Movie
    
    var backdropPath: String {
        guard let backdropPath = movie.backdropPath else { return "" }
        return Constants.imageURL + Constants.backdropSizes + backdropPath
    }
    
    var genres: String {
        if movie.genres.isEmpty { return "New" }
        let genre = Constants.genresData.first(where: {$0.id == movie.genres[0]})
        return genre?.name ?? "New"
    }
    
    var id: Int { movie.id }
    
    var originalLanguage: String { movie.originalLanguage ?? "" }
    
    var overview: String { movie.overview ?? "" }
    
    var posterPath: String {
        guard let posterPath = movie.posterPath else { return "" }
        return Constants.imageURL + Constants.posterSizes + posterPath
    }
    
    var releaseDate: String { movie.releaseDate ?? "" }
    
    var title: String { movie.title ?? "" }
    
    var voteAverage: Double { movie.voteAverage ?? 0.0 }
    
    var voteCount: Int { movie.voteCount ?? 0 }
}
