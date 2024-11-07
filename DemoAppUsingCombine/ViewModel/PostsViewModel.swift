//
//  PostsViewModel.swift
//  DemoAppUsingCombine
//
//  Created by Hammad on 07/11/2024.
//

import Foundation
import Combine

class PostsViewModel: ObservableObject {
    
    @Published var posts: [Post] = []
    private var cancellables = Set<AnyCancellable>()
    
    func getPosts() {
        NetworkManager.shared.fetchPosts()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Failed to fetch posts:", error)
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] posts in
                self?.posts = posts
            })
            .store(in: &cancellables)
    }
}
