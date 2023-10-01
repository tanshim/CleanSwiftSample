//
//  AuthService.swift
//  CleanSwiftSample
//
//  Created by Sultan on 23.07.2023.
//

import Foundation

protocol AuthService {
    func auth(login: String, password: String) -> User?
}

struct MainAuthService: AuthService {
    func auth(login: String, password: String) -> User? {
        for user in User.usersDB {
            if login.lowercased() == user.login && password == user.password {
                return user
            }
        }
        return nil
    }
}
