//
//  User.swift
//  Concurrency App
//
//  Created by shopnil hasan on 28/10/24.
//

struct Post: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
