//
//  User.swift
//  Concurrency App
//
//  Created by shopnil hasan on 28/10/24.
//

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
    let username: String
    let any: Bool
}
