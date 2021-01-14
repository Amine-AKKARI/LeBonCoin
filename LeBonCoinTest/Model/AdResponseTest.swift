//
//  AdResponseTest.swift
//  LeBonCoinTest
//
//  Created by Amine on 1/15/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import XCTest
@testable import LeBonCoin

class AdResponseTest: XCTestCase {
    
    func test_adsResponse_whenDecode_thenHasadsResponse () {
        let data = UtilsTests.jsonData(filename: "AdsResponseModel")
        do {
            guard let data = data else {return}
            let ads = try JSONDecoder().decode([Ad].self, from: data)
            XCTAssertEqual(ads.count, 300)
            
            let firstAd = ads[0]
            XCTAssertEqual(firstAd.advertisementId, 1461267313)
            XCTAssertEqual(firstAd.categoryId, 4)
            XCTAssertEqual(firstAd.title, "Statue homme noir assis en plâtre polychrome")
            XCTAssertEqual(firstAd.description, "Magnifique Statuette homme noir assis fumant le cigare en terre cuite et plâtre polychrome réalisée à la main.  Poids  1,900 kg en très bon état, aucun éclat  !  Hauteur 18 cm  Largeur : 16 cm Profondeur : 18cm  Création Jacky SAMSON  OPTIMUM  PARIS  Possibilité de remise sur place en gare de Fontainebleau ou Paris gare de Lyon, en espèces (heure et jour du rendez-vous au choix). Envoi possible ! Si cet article est toujours visible sur le site c'est qu'il est encore disponible")
            XCTAssertEqual(firstAd.price, 140)
            let imagesUrl = firstAd.imagesUrl
            XCTAssertEqual(imagesUrl?.small, "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/2c9563bbe85f12a5dcaeb2c40989182463270404.jpg")
            XCTAssertEqual(imagesUrl?.thumb, "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/2c9563bbe85f12a5dcaeb2c40989182463270404.jpg")
            XCTAssertEqual(firstAd.creationDate, "2019-11-05T15:56:59+0000")
            XCTAssertEqual(firstAd.isUrgent, false)
        } catch {
            print(error)
        }
    }
}
