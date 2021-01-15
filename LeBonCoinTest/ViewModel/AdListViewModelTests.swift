//
//  AdListViewModelTests.swift
//  LeBonCoinTest
//
//  Created by Amine on 1/15/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import XCTest
@testable import LeBonCoin
class AdListViewModelTests: XCTestCase {
    var adListViewModel: AdListViewModel!
    var adClient: AdClient!
    override func setUpWithError() throws {
        adClient = AdClient()
        adListViewModel = AdListViewModel(adClient: adClient)
        super.setUp()
    }
    override func tearDownWithError() throws {
        adListViewModel = nil
         super.tearDown()
    }
    
    func test_SearchForCategoryName_WhenCategoryId_ThenReturnCategoryName () {
        let category1 = AdCategory(categoryId:1, categoryName: "Véhicule")
        let category2 = AdCategory(categoryId:2, categoryName: "Mode")
        let category3 = AdCategory(categoryId:3, categoryName: "Bricolage")
        let categories = [category1, category2, category3]
        
        let categoryName = adListViewModel.searchForCategoryName(categories: categories, categoryId: 2)
        
        XCTAssertEqual(categoryName, "Mode")
    }
    
    func test_SortAds_WhenListAds_THenSortAdByDateAndUrgent () {
        let ad1 = Ad(advertisementId: 1, categoryId: 1, title: "title1", description: "desc1", imagesUrl: nil, price: 10, creationDate: "2019-11-05T15:56:59+0000", isUrgent: false)
        let ad2 = Ad(advertisementId: 2, categoryId: 2, title: "title2", description: "desc2", imagesUrl: nil, price: 10, creationDate: "2019-10-16T17:10:20+0000", isUrgent: true)
        let ad3 = Ad(advertisementId: 3, categoryId: 3, title: "title3", description: "desc3", imagesUrl: nil, price: 10, creationDate: "2019-11-05T15:56:55+0000", isUrgent: false)
        let ads = [ad1, ad2, ad3]
        let sortedAds = adListViewModel.sortAds(adsArray: ads)
        
        XCTAssertEqual(sortedAds[0].advertisementId, 2)
        XCTAssertEqual(sortedAds[0].categoryId, 2)
        XCTAssertEqual(sortedAds[0].title, "title2")
        XCTAssertEqual(sortedAds[0].creationDate, "2019-10-16T17:10:20+0000")
        XCTAssertEqual(sortedAds[0].description, "desc2")
        
        XCTAssertEqual(sortedAds[1].advertisementId, 1)
        XCTAssertEqual(sortedAds[1].categoryId, 1)
        XCTAssertEqual(sortedAds[1].title, "title1")
        XCTAssertEqual(sortedAds[1].creationDate, "2019-11-05T15:56:59+0000")
        XCTAssertEqual(sortedAds[1].advertisementId, 1)
        XCTAssertEqual(sortedAds[1].categoryId, 1)
    }
}

