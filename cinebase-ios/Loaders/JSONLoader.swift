//
//  JSONLoader.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 19/12/20.
//

import Foundation

class JSONLoader: ObservableObject {
    
    func load<T:Decodable>(_ filename:String, as type:T.Type = T.self) -> T {
        
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("Couldn’t find file")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn’t load data")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn’t decode data")
        }
    }
}
