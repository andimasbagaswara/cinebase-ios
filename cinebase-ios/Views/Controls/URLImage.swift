//
//  URLImage.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 20/12/20.
//

import SwiftUI

struct URLImage: View {
    
    @ObservedObject var imageLoader = ImageLoader()
    
    let url: String
    var failed: Image
    
    init(url: String, failed: Image = Image(systemName: "film")) {
        self.url = url
        self.failed = failed
        self.imageLoader.downloadImage(url: self.url)
    }
    
    var body: some View {
        selectImage()
    }
    
    @ViewBuilder private func selectImage() -> some View {
        switch imageLoader.loadingState {
        case .loading:
            ProgressView()
        case .failed:
            failed
        default:
            if let image = UIImage(data: imageLoader.downloadedData!) {
                Image(uiImage: image).resizable()
            } else {
                failed
            }
        }
    }
}
