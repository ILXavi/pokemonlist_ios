//
//  NetworkManager.swift
//  Pokemon List
//
//  Created by Miguel Estévez on 11/1/22.
//

import Foundation


final class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    static var baseUrl = "https://pokeapi.co/api/v2/"
    
    // Endpoints
    var pokemonListUrl = NetworkManager.baseUrl + "pokemon/"
    var pokemonDetailUrl = NetworkManager.baseUrl + "detail/" // This is an example
    
    func getPokemonList(completion: @escaping (Response?) -> Void) {
        guard let url = URL(string: pokemonListUrl) else {
            completion(nil)
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let networkTask = URLSession.shared.dataTask(with: urlRequest) {
            data, response, error in
            
            guard error == nil else {
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(Response.self, from: data)
                completion(response)
            } catch {
                completion(nil)
            }
        }
        
        networkTask.resume()
    }
    
    func getPokemonWith(detailURL: String, completion: @escaping (Pokemon?) -> Void){
        guard let url = URL(string: detailURL) else {
            completion(nil)
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let networkTask = URLSession.shared.dataTask(with: urlRequest) {
            data, response, error in
            
            guard error == nil else {
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let pokemon = try decoder.decode(Pokemon.self, from: data)
                completion(pokemon)
            } catch {
                completion(nil)
            }
        }
        
        networkTask.resume()
        
    }
    
}

