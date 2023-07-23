//
//  SceneFactory.swift
//  CleanSwiftSample
//
//  Created by Sultan on 23.07.2023.
//

import Foundation
import UIKit

protocol SceneFactory {
    var configurator: LoginSceneConfigurator! { get set }
    func makeLoginScene() -> UIViewController
}

final class DefaultSceneFactory: SceneFactory {
    var configurator: LoginSceneConfigurator!

    func makeLoginScene() -> UIViewController {
        let vc = LoginSceneViewController()
        return configurator.configured(vc)
    }
}
