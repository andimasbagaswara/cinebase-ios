//
//  Constants.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 19/12/20.
//

import UIKit

struct Constants {
    
    static let apiKey = ""
    
    static let baseURL = "https://api.themoviedb.org/3"
    
    static let imageURL = "http://image.tmdb.org/t/p"
    
    static let posterSizes = "/w500"
    
    static let backdropSizes = "/w500"
    
    static let widthRatio: CGFloat = UIScreen.main.bounds.width / 375
    
    static let heightRatio: CGFloat = UIScreen.main.bounds.height / 812
    
    static let moviePreviewData: [Movie] = JSONLoader().load("MoviePreviewData.json")
    
    static let movieDetailPreviewData: MovieDetail = JSONLoader().load("MovieDetailPreviewData.json")
    
    static let genresData: [Genre] = JSONLoader().load("GenresData.json")
}
