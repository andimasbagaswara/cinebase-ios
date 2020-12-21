//
//  MovieDetailViewModel.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 19/12/20.
//

import Foundation

struct MovieDetailViewModel {
    
    let movieDetail: MovieDetail
    
    var backdropPath: String { Constants.imageURL + Constants.backdropSizes + movieDetail.backdropPath }
    
    var genres: String {
        if movieDetail.genres.isEmpty { return "New" }
        let genre = Constants.genresData.first(where: {$0.id == movieDetail.genres[0].id})
        return genre?.name ?? "New"
    }
    
    var homepage: String { movieDetail.homepage }
    
    var id: Int { movieDetail.id }
    
    var overview: String { movieDetail.overview }
    
    var posterPath: String { Constants.imageURL + Constants.posterSizes + movieDetail.posterPath }
    
    var releaseDate: String { movieDetail.releaseDate }
    
    var runtime: Int { movieDetail.runtime }
    
    var spokenLanguage: String {
        if movieDetail.spokenLanguages.isEmpty { return "English" }
        return movieDetail.spokenLanguages[0].name
    }
    
    var status: String { movieDetail.status }
    
    var tagline: String { movieDetail.tagline }
    
    var title: String { movieDetail.title }
    
    var voteAverage: Double { movieDetail.voteAverage }
    
    var voteCount: Int { movieDetail.voteCount }
}
