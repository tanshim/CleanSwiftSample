//
//  SceneDelegate.swift
//  CleanSwiftSample
//
//  Created by Sultan on 22.07.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let sceneFactory = DefaultSceneFactory()
        sceneFactory.configurator = DefaultLoginSceneConfigurator(sceneFactory: sceneFactory)
        let navController = UINavigationController(rootViewController: sceneFactory.makeLoginScene())
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
