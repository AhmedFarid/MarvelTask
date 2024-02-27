//
//  AppCoordinator.swift
//  MarvelTask
//
//  Created by Systems on 27/02/2024.
//

import UIKit

final class AppCoordinator: Coordinator {

    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController = UINavigationController()

    private var window: UIWindow?

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
