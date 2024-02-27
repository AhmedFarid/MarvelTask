//
//  Coordinator.swift
//  MarvelTask
//
//  Created by Systems on 27/02/2024.
//

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] {get}
    func start()
}
