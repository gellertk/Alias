//
//  NetworkManager.swift
//  Alias
//
//  Created by Кирилл  Геллерт on 05.05.2022.
//

import Foundation

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    let api = "https://joke.deno.dev"
    
    func getJoke(completion: @escaping (Result<Joke, Error>) -> ()) {
        
        guard let url = URL(string: api) else {
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                return
            }
 
            do {
                let data = try JSONDecoder().decode(Joke.self, from: data)
                completion(.success(data))
            } catch {
                completion(.failure(error))
            }
        }
        dataTask.resume()
        
    }
    
}
