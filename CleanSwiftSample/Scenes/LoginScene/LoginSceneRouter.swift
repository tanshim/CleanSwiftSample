//
//  LoginSceneRouter.swift
//  CleanSwiftSample
//
//  Created by Sultan on 23.07.2023.
//

import Foundation
import UIKit

protocol LoginSceneRouting {
    func showLoginSuccess(user: User)
    func showLoginFailure(message: String)
}

final class LoginSceneRouter {
    weak var source: UIViewController?
}

extension LoginSceneRouter: LoginSceneRouting {
    func showLoginSuccess(user: User) {
        let action = UIAlertAction(title: "OK", style: .destructive)
        let alertController
            = UIAlertController(title: "Login Success",
                                message: "Welcome, \(user.login)!",
                                preferredStyle: .alert)
        alertController.addAction(action)
        source?.present(alertController, animated: true)
    }

    func showLoginFailure(message: String) {
        let action = UIAlertAction(title: "OK", style: .destructive)
        let alertController
            = UIAlertController(title: "Login Failure",
                                message: message,
                                preferredStyle: .alert)
        alertController.addAction(action)
        source?.present(alertController, animated: true)
    }
}
