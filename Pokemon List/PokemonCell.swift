//
//  PokemonCell.swift
//  Pokemon List
//
//  Created by Miguel Estévez on 11/1/22.
//

import UIKit

class PokemonCell: UITableViewCell {
    
    static let identifier = "PokemonCellIdentifier"
    @IBOutlet var nameLabel: UILabel!
    
    var pokemonName: PokemonName? {
        didSet { renderUI() }
    }
    
    private func renderUI() {
        guard let pokemonName = pokemonName else {
            return
        }
        nameLabel.text = pokemonName.name.capitalized
    }
}
