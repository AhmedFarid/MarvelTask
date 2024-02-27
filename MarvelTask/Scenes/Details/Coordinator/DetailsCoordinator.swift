//
//  DetailsCoordinator.swift
//  MarvelTask
//
//  Created by Systems on 27/02/2024.
//

import UIKit

protocol DetailsTransitionDelegate: AnyObject {
    func backHome()
}

class DetailsCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController

    weak var parentCoordinator: HomeChilDelegate?
    private var homeData: HomeModel?

    init(navigationController: UINavigationController, homeData: HomeModel?) {
        self.navigationController = navigationController
        self.homeData = homeData
    }

    deinit {
        print("de init \(self.self)")
    }

    func start() {
        guard let homeData = homeData else {return}
        let viewController = DetailsViewController(viewModel: DetailsViewModel(homeData: homeData))
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension DetailsCoordinator: DetailsTransitionDelegate {
    func backHome() {
        parentCoordinator?.didFinish(self)
    }
}
