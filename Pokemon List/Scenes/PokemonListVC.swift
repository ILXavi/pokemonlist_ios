//
//  ViewController.swift
//  Pokemon List
//
//  Created by Miguel Estévez on 11/1/22.
//

import UIKit

class PokemonListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    var response: Response?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Pokèmons"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.isHidden = true
        NetworkManager.shared.getPokemonList {
            response in
            
            DispatchQueue.main.async {
                self.response = response
                self.tableView.isHidden = false
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - UITableView delegate & data source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonCell.identifier, for: indexPath) as! PokemonCell
        cell.pokemonName = response?.results[indexPath.row]
        return cell
    }

}

