//
//  Pokemon.swift
//  Pokemon List
//
//  Created by APPS2T on 13/1/22.
//

import Foundation

struct Pokemon: Codable {
    var name: String
    var id: Int
    var height: Float?
    var weight: Float?
    var sprites: Sprites
}

