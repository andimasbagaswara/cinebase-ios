//
//  MovieService.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 19/12/20.
//

import UIKit

class MovieService: ObservableObject {
    
    private init() { }
    
    static let shared = MovieService()
    
    func getMoviesByCategory(url: URL?, completion: @escaping (Result<[Movie]?, NetworkError>) -> Void) {
        
        guard let url = url else { return completion(.failure(.badURL)) }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else { return completion(.failure(.noData)) }
            
            guard let response = try? JSONDecoder().decode(MovieResponse.self, from: data) else { return completion(.failure(.decodingError)) }
            
            completion(.success(response.movies))
            
        }.resume()
    }
    
    func getMovieDetailBy(id: Int, completion: @escaping (Result<MovieDetail?, NetworkError>) -> Void) {
        
        guard let url = URL.urlForMovieDetail(id: id) else { return completion(.failure(.badURL)) }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else { return completion(.failure(.noData)) }
            
            guard let response = try? JSONDecoder().decode(MovieDetail.self, from: data) else { return completion(.failure(.decodingError)) }
            
            completion(.success(response))
            
        }.resume()
    }
}
