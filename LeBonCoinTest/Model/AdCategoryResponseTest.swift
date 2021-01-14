//
//  AdCategoryResponseTest.swift
//  LeBonCoinTest
//
//  Created by Amine on 1/15/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import XCTest
@testable import LeBonCoin

class AdCategoryResponseTest: XCTestCase {

    func test_CategoriesResponse_whenDecode_thenHasadsResponse () {
        let data = UtilsTests.jsonData(filename: "AdCategoriesResponseModel")
        do {
            guard let data = data else {return}
            let categories = try JSONDecoder().decode([AdCategory].self, from: data)
            XCTAssertEqual(categories.count, 11)
            let firstCategory = categories[0]
            XCTAssertEqual(firstCategory.categoryId, 1)
            XCTAssertEqual(firstCategory.categoryName, "Véhicule")
        } catch {
            print(error)
        }
    }
}
