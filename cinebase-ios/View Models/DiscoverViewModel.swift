//
//  DiscoverViewModel.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 20/12/20.
//

import Foundation

class DiscoverViewModel: ObservableObject {
    
    @Published var nowPlayingList = [MovieViewModel]()
    @Published var popularList = [MovieViewModel]()
    @Published var topRatedList = [MovieViewModel]()
    
    func loadData() {
        
        MovieService.shared.getMoviesByCategory(url: URL.urlForNowPlayingMovies()) { (result) in
            switch result {
            case .success(let response):
                if let movieList = response {
                    DispatchQueue.main.async {
                        self.nowPlayingList = movieList[0...2].map(MovieViewModel.init)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        MovieService.shared.getMoviesByCategory(url: URL.urlForPopularMovies()) { (result) in
            switch result {
            case .success(let response):
                if let movieList = response {
                    DispatchQueue.main.async {
                        self.popularList = movieList[0...4].map(MovieViewModel.init)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        MovieService.shared.getMoviesByCategory(url: URL.urlForTopRatedMovies()) { (result) in
            switch result {
            case .success(let response):
                if let movieList = response {
                    DispatchQueue.main.async {
                        self.topRatedList = movieList[0...4].map(MovieViewModel.init)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
