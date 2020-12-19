//
//  NetworkError.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 19/12/20.
//

import Foundation

enum NetworkError: Error {
    
    case badURL
    case noData
    case encodingError
    case decodingError
}
