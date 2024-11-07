//
//  NetworkManager.swift
//  DemoAppUsingCombine
//
//  Created by Hammad on 07/11/2024.
//

import Foundation
import Combine

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchPosts() -> AnyPublisher<[Post], Error> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
