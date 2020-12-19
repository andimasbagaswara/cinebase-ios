//
//  ImageLoader.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 19/12/20.
//

import Foundation

class ImageLoader: ObservableObject {
    
    @Published var downloadedData: Data?
    @Published var loadingState: LoadingState = .none
    
    func downloadImage(url:String) {
        
        self.loadingState = .loading
        
        guard let imageURL = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            
            guard let data = data, error == nil else { return }
            
            if data.count > 0 {
                DispatchQueue.main.async {
                    self.downloadedData = data
                    self.loadingState = .success
                }
            } else {
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }.resume()
    }
}
