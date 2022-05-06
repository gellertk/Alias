//
//  SceneDelegate.swift
//  Alias
//
//  Created by Кирилл  Геллерт on 02.05.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowsScene = (scene as? UIWindowScene) else {
            return
        }
        
        self.window = UIWindow(windowScene: windowsScene)
        self.window?.rootViewController = MainNavigationController(rootViewController: RulesViewController())
        self.window?.makeKeyAndVisible()
    }

}

