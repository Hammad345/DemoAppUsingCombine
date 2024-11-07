//
//  Post.swift
//  DemoAppUsingCombine
//
//  Created by Hammad on 07/11/2024.
//

import Foundation

struct Post: Codable, Identifiable {
    let id: Int
    let title: String
    let body: String
}
