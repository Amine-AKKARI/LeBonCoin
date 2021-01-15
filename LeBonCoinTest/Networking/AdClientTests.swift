//
//  AdClientTests.swift
//  LeBonCoinTest
//
//  Created by Amine on 1/15/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import XCTest
@testable import LeBonCoin
class AdClientTests: XCTestCase {
    var adClient: AdClient!
    override func setUpWithError() throws {
        super.setUp()
        adClient = AdClient ()
    }

    override func tearDownWithError() throws {
        adClient = nil
         super.tearDown()
    }

    func test_AdClient_whenGetAds_thenHaveResponse () {
        let adEndPointType: EndPointType = .ads
        _ = adEndPointType.request
        let promise = expectation(description: "json returned is array of ads")
        adClient.getAds(from: adEndPointType) { result in
            switch result{
            case .success( _):
                promise.fulfill()
            case .failure( let error):
                XCTFail("An error occured : \(error)")
            }
        }
        wait(for: [promise], timeout: 5)
    }
    
    func test_AdClient_whenGetCategories_thenHaveResponse () {
        let categoriesEndPointType: EndPointType = .categories
        _ = categoriesEndPointType.request
        let promise = expectation(description: "json returned is array of categories")
        adClient.getCategories(from: categoriesEndPointType) { result in
            switch result{
            case .success( _):
                promise.fulfill()
            case .failure( let error):
                XCTFail("An error occured : \(error)")
            }
        }
        wait(for: [promise], timeout: 5)
    }
}
