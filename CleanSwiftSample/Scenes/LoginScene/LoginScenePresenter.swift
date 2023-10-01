//
//  LoginScenePresenter.swift
//  CleanSwiftSample
//
//  Created by Sultan on 23.07.2023.
//

import Foundation

typealias LoginScenePresenterInput = LoginSceneInteractorOutput
typealias LoginScenePresenterOutput = LoginSceneViewControllerInput

final class LoginScenePresenter {
    weak var viewController: LoginScenePresenterOutput?
}

extension LoginScenePresenter: LoginScenePresenterInput {
    func showLoginSuccess(user: User) {
        viewController?.showLoginSuccess(user: user)
    }

    func showLoginFailure(message: String) {
        viewController?.showLoginFailure(message: "Error! \(message)")
    }
}
