//
//  LoginSceneInteractor.swift
//  CleanSwiftSample
//
//  Created by Sultan on 23.07.2023.
//

import Foundation

typealias LoginSceneInteractorInput = LoginSceneViewControllerOutput

protocol LoginSceneInteractorOutput: AnyObject {
    func showLoginSuccess(user: User)
    func showLoginFailure(message: String)
}

final class LoginSceneInteractor {
    var presenter: LoginScenePresenterInput?
    var authService: AuthService?
}

extension LoginSceneInteractor: LoginSceneInteractorInput {
    func tryToLogIn(userLogin: String, password: String) {
        if let user = authService?.auth(login: userLogin, password: password) {
            presenter?.showLoginSuccess(user: user)
        } else {
            presenter?.showLoginFailure(message: "Invalid username or password.")
        }
    }
}
