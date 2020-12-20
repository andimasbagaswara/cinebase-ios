//
//  MovieDetail.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 19/12/20.
//

import Foundation

struct MovieDetail: Codable {
    
    let backdropPath: String
    let genres: [Genre]
    let id: Int
    let overview: String
    let posterPath: String
    let releaseDate: String
    let runtime: Int
    let status: String
    let tagline: String
    let title: String
    
    private enum CodingKeys: String, CodingKey {
        
        case backdropPath = "backdrop_path"
        case genres
        case id
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case runtime
        case status
        case tagline
        case title
    }
}

struct Genre: Codable {
    
    let id: Int
    let name: String
}
