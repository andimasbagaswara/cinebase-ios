//
//  MovieDetail.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 19/12/20.
//

import Foundation

struct MovieDetail: Codable {
    
    let backdropPath: String?
    let genres: [Genre]
    let homepage: String?
    let id: Int
    let overview: String?
    let posterPath: String?
    let releaseDate: String?
    let runtime: Int?
    let spokenLanguages: [SpokenLanguage]
    let status: String?
    let tagline: String?
    let title: String?
    let voteAverage: Double?
    let voteCount: Int?
    
    private enum CodingKeys: String, CodingKey {
        
        case backdropPath = "backdrop_path"
        case genres
        case homepage
        case id
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case runtime
        case spokenLanguages = "spoken_languages"
        case status
        case tagline
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct Genre: Codable {
    
    let id: Int
    let name: String?
}

struct SpokenLanguage: Codable {
    
    let name: String?
}
