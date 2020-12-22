//
//  SearchViewModel.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 22/12/20.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    @Published var loadingState = LoadingState.none
    @Published var movieList = [MovieViewModel]()
    
    func searchByName(_ name: String) {
        
        if name.isEmpty {
           return
        }
        
        self.loadingState = .loading
        
        MovieService.shared.getMoviesByName(name: name.trimmedAndEscaped()) { (result) in
            switch result {
            case .success(let response):
                if let movieList = response {
                    DispatchQueue.main.async {
                        self.movieList = movieList.map(MovieViewModel.init)
                        self.loadingState = .success
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
    }
}
