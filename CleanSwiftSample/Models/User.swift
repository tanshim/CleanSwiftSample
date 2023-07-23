//
//  User.swift
//  CleanSwiftSample
//
//  Created by Sultan on 23.07.2023.
//

import Foundation

struct User {
    let login: String
    var password: String
}

extension User {
    // Simulating local DB
    static var usersDB: [User] =
    [
        User(login: "john-wick", password: "12345"),
        User(login: "khan-ata", password: "12345"),
        User(login: "jackie-chan", password: "12345")
    ]
}
