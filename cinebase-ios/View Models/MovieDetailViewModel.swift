//
//  MovieDetailViewModel.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 19/12/20.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    
    @Published var loadingState = LoadingState.loading
    @Published var reviewList = [ReviewViewModel]()
    
    private var movieDetail: MovieDetail?
    
    init(movieDetail: MovieDetail? = nil) {
        self.movieDetail = movieDetail
    }
    
    func getMovieDetailById(id: Int) {
        
        MovieService.shared.getMovieDetailBy(id: id) { result in
            switch result {
                case .success(let details):
                    DispatchQueue.main.async {
                        self.movieDetail = details
                        self.loadingState = .success
                    }
                
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
                   
            }
        }
        
        MovieService.shared.getMovieReviewBy(id: id) { (result) in
            switch result {
            case .success(let response):
                if let reviewList = response {
                    DispatchQueue.main.async {
                        self.reviewList = reviewList.map(ReviewViewModel.init)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func checkItem() -> Bool {
        if CoreDataManager.shared.fetchItem(id: self.id) != nil {
            return true
        } else {
            return false
        }
    }
    
    func saveItem() {
        CoreDataManager.shared.saveItem(id: id, title: title, genre: genres, rating: voteAverage, backdropPath: backdropPath)
    }
    
    func deleteItem() {
        CoreDataManager.shared.deleteItem(id: self.id)
    }
    
    var backdropPath: String {
        let backdropPath = self.movieDetail?.backdropPath ?? ""
        return Constants.imageURL + Constants.backdropSizes + backdropPath
    }
    
    var genres: String {
        guard let genres = self.movieDetail?.genres else { return "New" }
        return genres[0].name
    }
    
    var homepage: String { self.movieDetail?.homepage ?? "" }
    
    var id: Int { self.movieDetail?.id ?? 0 }
    
    var overview: String { self.movieDetail?.overview ?? "" }
    
    var posterPath: String {
        let posterPath = self.movieDetail?.posterPath ?? ""
        return Constants.imageURL + Constants.posterSizes + posterPath
    }
    
    var releaseDate: String { self.movieDetail?.releaseDate ?? "" }
    
    var runtime: Int { self.movieDetail?.runtime ?? 0 }
    
    var spokenLanguage: String {
        guard let spokenLanguages = self.movieDetail?.spokenLanguages else { return "English" }
        return spokenLanguages[0].name
    }
    
    var status: String { self.movieDetail?.status ?? "" }
    
    var tagline: String { self.movieDetail?.tagline ?? "" }
    
    var title: String { self.movieDetail?.title ?? "" }
    
    var voteAverage: Double { self.movieDetail?.voteAverage ?? 0.0 }
    
    var voteCount: Int { self.movieDetail?.voteCount ?? 0 }
}
