//
//  CoordinatorTests.swift
//  LeBonCoinTest
//
//  Created by Amine on 1/15/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import XCTest
@testable import LeBonCoin
class CoordinatorTests: XCTestCase {
    var coordinator: MainCoordinator!
    //var presenter = AdListViewController ()
    override func setUpWithError() throws {
        let navigationController = UINavigationController()
        coordinator = MainCoordinator(navigationController: navigationController)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_TopViewController_WhenApplicationLaunched_ThenAdListViewControllerPushed () {
        // Act
        coordinator.start()
          RunLoop.current.run(until: Date())
        guard let _ =  coordinator.navigationController.topViewController as? AdListViewController else {
              XCTFail()
              return
          }
    }
    
    func test_TopViewController_whenShooseFilter_ThenSelectCategoryVCPresented () {
        let category1 = AdCategory(categoryId: 1, categoryName: "Véhicule")
        let category2 = AdCategory(categoryId: 2, categoryName: "Mode")
        let category3 = AdCategory(categoryId: 3, categoryName: "Bricolage")
        let categories = [category1, category2, category3]
        coordinator.start()
        coordinator.presentSelectCategoryVC(categories: categories)
        RunLoop.current.run(until: Date())
        guard coordinator.presenter.presentedViewController != coordinator.presenter else {
            XCTFail()
            return
        }
    }
}

