//
//  RickAndMortyChar.swift
//  RickAndMorty
//
//  Created by Joshua Viera on 1/2/19.
//  Copyright © 2019 Joshua Viera. All rights reserved.
//

import Foundation

//struct Page : Codable {
//    var next: String
//    let prev: String
//}
struct ResultsWrapper : Codable {
    var results: [RickAndMortyChar]
}

struct RickAndMortyChar : Codable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var image: String
//    var origin: [OriginWrapper]
}
//
//struct OriginWrapper : Codable {
//    let name: String?
//
//}
