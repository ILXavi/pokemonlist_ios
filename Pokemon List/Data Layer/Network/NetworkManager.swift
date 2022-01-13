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
    static var pokemonListUrl = baseUrl + "pokemon/"
    static var pokemonDetailUrl = baseUrl + "detail/"
    
    func getPokemonList(completion: @escaping (Response?) -> Void) {
        guard let url = URL(string: NetworkManager.pokemonListUrl) else {
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
    
}

