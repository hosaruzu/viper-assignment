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

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}
