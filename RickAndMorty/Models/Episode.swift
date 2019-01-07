//
//  Episode.swift
//  RickAndMorty
//
//  Created by Joshua Viera on 1/6/19.
//  Copyright © 2019 Joshua Viera. All rights reserved.
//

import Foundation

struct Results : Codable {
    var results: [RickAndMortyEp]
}

struct RickAndMortyEp : Codable {
    var id: Int
    var name: String
    var air_date: String
    var episode: String
    var url: String
}
