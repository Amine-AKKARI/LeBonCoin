//
//  MainCoordinator.swift
//  LeBonCoin
//
//  Created by Amine on 1/14/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var presenter = AdListViewController()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        presenter = AdListViewController()
        navigationController.pushViewController(presenter, animated: false)
    }
}
