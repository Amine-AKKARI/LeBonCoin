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
        presenter.coordinator = self
        navigationController.pushViewController(presenter, animated: false)
    }
    
    /**
     Present SelectCategoryViewController
     - Parameter categories: [AdCategories] Array of categories
     */
    func presentSelectCategoryVC(categories: [AdCategory]) {
        let vc = SelectCategoryViewController()
        vc.coordinator = self
        vc.delegate = presenter.adListViewModel
        vc.categories = categories
        let navController = UINavigationController(rootViewController: vc)
        presenter.present(navController, animated:true, completion: nil)
    }
    /**
    Dismiss View Controller
    - Parameter vc: UIViewController ViewController to dismiss
    */
    func dismissSelectCategortVC (vc: UIViewController ) {
        vc.dismiss(animated: true, completion: nil)
    }
}
