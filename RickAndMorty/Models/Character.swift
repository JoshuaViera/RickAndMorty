//
//  Character.swift
//  RickAndMorty
//
//  Created by Joshua Viera on 1/6/19.
//  Copyright © 2019 Joshua Viera. All rights reserved.
//

import Foundation
struct ResultsWrapper : Codable {
    var results: [RickAndMortyChar]
}

struct RickAndMortyChar : Codable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var image: String
    var origin: OriginWrapper
    var location: LocationWrapper
}

struct OriginWrapper : Codable {
    var name: String    
}
struct LocationWrapper : Codable {
    var name: String
}
