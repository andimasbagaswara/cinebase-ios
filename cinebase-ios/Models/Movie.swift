//
//  Movie.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 20/12/20.
//

import Foundation

struct MovieResponse: Codable {
    let page: Int
    let movies: [Movie]
    let totalPages: Int
    
    private enum CodingKeys: String, CodingKey {
        
        case page
        case movies = "results"
        case totalPages = "total_pages"
    }
}

struct Movie: Codable {
    
    let backdropPath: String
    let genres: [Int]
    let id: Int
    let originalLanguage: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let title: String
    let voteAverage: Double
    let voteCount: Int
    
    private enum CodingKeys: String, CodingKey {
        
        case backdropPath = "backdrop_path"
        case genres = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
