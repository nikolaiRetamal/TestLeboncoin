//
//  AppCoordinator.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 19/07/2023.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.tintColor = .label
    }

    func start() {
        let coordinator = ProductFlowCoordinator(navigationController: navigationController)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
