//
//  AdViewModelTests.swift
//  LeBonCoinTest
//
//  Created by Amine on 1/15/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import XCTest
@testable import LeBonCoin

class AdViewModelTests: XCTestCase {
    var ad: Ad!
    var adViewModel: AdViewModel!
    override func setUpWithError() throws {
        super.setUp()
        ad = Ad(advertisementId:1461267313 ,
                categoryId: 4,
                title: "Statue homme noir assis en plâtre polychrome",
                description: "Magnifique Statuette homme noir assis fumant le cigare en terre cuite et plâtre polychrome réalisée à la main.  Poids  1,900 kg en très bon état, aucun éclat  !  Hauteur 18 cm  Largeur : 16 cm Profondeur : 18cm  Création Jacky SAMSON  OPTIMUM  PARIS  Possibilité de remise sur place en gare de Fontainebleau ou Paris gare de Lyon, en espèces (heure et jour du rendez-vous au choix). Envoi possible ! Si cet article est toujours visible sur le site c'est qu'il est encore disponible",
                imagesUrl:ImagesUrl(small:"https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/2c9563bbe85f12a5dcaeb2c40989182463270404.jpg",
                                    thumb:"https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/2c9563bbe85f12a5dcaeb2c40989182463270404.jpg"),
                price: 140,
                creationDate: "2019-11-05T15:56:59+0000", isUrgent: false)
        
        adViewModel = AdViewModel(ad: ad, categoryName: "Maison")
    }
    
    
    override func tearDownWithError() throws {
        ad = nil
        adViewModel = nil
        super.tearDown()
    }
    
    func test_AdViewModel_WhenAdViewModelCreated_thenSetAdViewModelCategoryName () {
        XCTAssertEqual(adViewModel.categoryName, "Maison")
    }
    func test_AdViewModel_WhenAdViewModelCreated_thenSetAdViewModelTitle () {
        XCTAssertEqual(adViewModel.title, "Statue homme noir assis en plâtre polychrome")
    }
    func test_AdViewModel_WhenAdViewModelCreated_thenSetAdViewModelDescription () {
        XCTAssertEqual(adViewModel.description, "Magnifique Statuette homme noir assis fumant le cigare en terre cuite et plâtre polychrome réalisée à la main.  Poids  1,900 kg en très bon état, aucun éclat  !  Hauteur 18 cm  Largeur : 16 cm Profondeur : 18cm  Création Jacky SAMSON  OPTIMUM  PARIS  Possibilité de remise sur place en gare de Fontainebleau ou Paris gare de Lyon, en espèces (heure et jour du rendez-vous au choix). Envoi possible ! Si cet article est toujours visible sur le site c'est qu'il est encore disponible")
    }
    func test_AdViewModel_WhenAdViewModelCreated_thenSetAdViewModelSmallImageURL () {
        XCTAssertEqual(adViewModel.smallImageUrl, "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/2c9563bbe85f12a5dcaeb2c40989182463270404.jpg")
    }
    func test_AdViewModel_WhenAdViewModelCreated_thenSetAdViewModelThumbImageURL () {
           XCTAssertEqual(adViewModel.thumbImageURl, "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/2c9563bbe85f12a5dcaeb2c40989182463270404.jpg")
       }
    
    func test_AdViewModel_WhenAdViewModelCreated_thenSetAdViewModelPrice () {
        XCTAssertEqual(adViewModel.price, "140 €" )
    }
    func test_AdViewModel_WhenAdViewModelCreated_thenSetAdViewModelCreationDate () {
        XCTAssertEqual(adViewModel.creationDate, "05/11/2019 15:56:59")
    }
    func test_AdViewModel_WhenAdViewModelCreated_thenSetAdViewModelIsUrgent () {
        XCTAssertEqual(adViewModel.state, "Non urgent")
    }
    
}

