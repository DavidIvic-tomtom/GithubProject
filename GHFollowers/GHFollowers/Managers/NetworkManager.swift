//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by David on 5.2.25..
//

import Foundation


class NetworkManager {
    static let shared = NetworkManager()
    
    let baseURL = "https://api.github.com/users/"
    
    private init() {}
    
    // func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, ErrorMessage?) -> Void ) {
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void ) {
        let endpoint = baseURL + username + "/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidDataReceived))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidDecoding))
            }
        }
        task.resume()
    }
}
