//
//  String+Extensions.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 22/12/20.
//

import Foundation

extension String {
    
    func trimmedAndEscaped() -> String {
        
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}
