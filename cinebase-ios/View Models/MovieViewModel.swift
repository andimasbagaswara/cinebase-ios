//
//  MovieViewModel.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 20/12/20.
//

import Foundation

struct MovieViewModel {
    
    let movie: Movie
    
    var backdropPath: String { Constants.imageURL + Constants.backdropSizes + movie.backdropPath }
    
    var genres: String {
        if movie.genres.isEmpty { return "New" }
        let genre = Constants.genresData.first(where: {$0.id == movie.genres[0]})
        return genre?.name ?? "New"
    }
    
    var id: Int { movie.id }
    
    var originalLanguage: String { movie.originalLanguage }
    
    var overview: String { movie.overview }
    
    var posterPath: String { Constants.imageURL + Constants.posterSizes + movie.posterPath }
    
    var releaseDate: String { movie.releaseDate }
    
    var title: String { movie.title }
    
    var voteAverage: Int { Int(ceil(movie.voteAverage)) }
    
    var voteCount: Int { movie.voteCount }
}
