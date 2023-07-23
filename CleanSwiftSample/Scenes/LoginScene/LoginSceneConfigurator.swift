//
//  LoginSceneConfigurator.swift
//  CleanSwiftSample
//
//  Created by Sultan on 23.07.2023.
//

import Foundation

protocol LoginSceneConfigurator {
    func configured(_ vc: LoginSceneViewController) -> LoginSceneViewController
}

final class DefaultLoginSceneConfigurator: LoginSceneConfigurator {
    private var sceneFactory: SceneFactory

    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }

    @discardableResult
    func configured(_ vc: LoginSceneViewController) -> LoginSceneViewController {
        sceneFactory.configurator = self
        let authService = MainAuthService()
        let interactor = LoginSceneInteractor()
        let presenter = LoginScenePresenter()
        let router = LoginSceneRouter()
        router.source = vc
        presenter.viewController = vc
        interactor.presenter = presenter
        interactor.authService = authService
        vc.interactor = interactor
        vc.router = router
        return vc
    }
}
