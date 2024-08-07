//
//  SceneDelegate.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 22.06.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = createListModule()
        window?.makeKeyAndVisible()
    }

    func createListModule() -> UINavigationController {
        let viewController = ListViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        ListAssembly.build(with: viewController)
        return navigationController
    }
}
