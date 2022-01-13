//
//  Response.swift
//  Pokemon List
//
//  Created by Miguel Estévez on 11/1/22.
//

import Foundation

struct Response: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [PokemonName]
}
