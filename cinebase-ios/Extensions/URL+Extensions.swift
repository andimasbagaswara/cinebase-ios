//
//  URL+Extensions.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 19/12/20.
//

import Foundation

extension URL {
    
    // MARK: GET "/movie/{movie_id}"
    static func urlForMovieDetail(id: String) -> URL? {
        return URL(string: "\(Constants.baseURL)/movie/\(id)?api_key=\(Constants.apiKey)&language=en-US")
    }
    
    // MARK: GET "/movie/{movie_id}/reviews"
    static func urlForMovieReview(id: String) -> URL? {
        return URL(string: "\(Constants.baseURL)/movie/\(id)/reviews?api_key=\(Constants.apiKey)&language=en-US")
    }
    
    // MARK: GET "/movie/popular"
    static func urlForPopularMovies() -> URL? {
        return URL(string: "\(Constants.baseURL)/movie/popular?api_key=\(Constants.apiKey)&language=en-US")
    }
    
    // MARK: GET "/movie/top_rated"
    static func urlForTopRatedMovies() -> URL? {
        return URL(string: "\(Constants.baseURL)/movie/top_rated?api_key=\(Constants.apiKey)&language=en-US")
    }
    
    // MARK: GET "/movie/now_playing"
    static func urlForNowPlayingMovies() -> URL? {
        return URL(string: "\(Constants.baseURL)/movie/now_playing?api_key=\(Constants.apiKey)&language=en-US")
    }
}
