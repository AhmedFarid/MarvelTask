//
//  HomeCoordinator.swift
//  MarvelTask
//
//  Created by Systems on 27/02/2024.
//

import UIKit

protocol HomeTransitionDelegate: AnyObject {
    func goDetails(homeData: HomeModel)
}

protocol HomeChilDelegate: AnyObject {
    func didFinish(_ coordinator: Coordinator)
}

class HomeCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    deinit {
        print("de init \(self.self)")
    }

    func start() {
        let viewController = HomeViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension HomeCoordinator: HomeTransitionDelegate {

    func goDetails(homeData: HomeModel) {
        let detailsCoordinator = DetailsCoordinator(navigationController: navigationController, homeData: homeData)
        detailsCoordinator.parentCoordinator = self
        childCoordinators.append(detailsCoordinator)
        detailsCoordinator.start()
    }
}

extension HomeCoordinator: HomeChilDelegate {
    func didFinish(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { childCoordinator in
            childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
            navigationController.popViewController(animated: true)
        }
    }
}
