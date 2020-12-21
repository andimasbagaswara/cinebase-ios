//
//  ItemViewModel.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 21/12/20.
//

import Foundation

class ItemViewModel {
    
    var id: NSDecimalNumber = 0
    var title: String = ""
    var genre: String = ""
    var rating: Double = 0.0
    var backdropPath: String = ""
    
    init(item: Item) {
        self.id = item.id!
        self.title = item.title!
        self.genre = item.genre!
        self.rating = item.rating
        self.backdropPath = item.backdropPath!
    }
    
}
