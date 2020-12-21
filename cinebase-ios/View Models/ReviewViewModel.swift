//
//  ReviewViewModel.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 21/12/20.
//

import Foundation

struct ReviewViewModel {
    
    let review: Review
    
    var authorDetails: AuthorDetails { review.authorDetails }
    
    var content: String { review.content ?? "" }
    
    var createdAt: String { review.createdAt ?? "" }
    
    var id: String { review.id }
    
    var updatedAt: String { review.updatedAt ?? "" }
}
