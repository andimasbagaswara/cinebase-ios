//
//  Review.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 21/12/20.
//

import Foundation

struct ReviewResponse: Codable {
    let page: Int
    let results: [Review]
    let totalPages: Int
    let totalResults: Int
    
    private enum CodingKeys: String, CodingKey {
        
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Review: Codable {
    let authorDetails: AuthorDetails
    let content: String?
    let createdAt: String?
    let id: String
    let updatedAt: String?
    
    private enum CodingKeys: String, CodingKey {
        
        case authorDetails = "author_details"
        case content
        case createdAt = "created_at"
        case id
        case updatedAt = "updated_at"
    }
}

struct AuthorDetails: Codable {
    let username: String?
    let avatarPath: String?
    let rating: Double?
    
    private enum CodingKeys: String, CodingKey {
        
        case username
        case avatarPath = "avatar_path"
        case rating
    }
}
