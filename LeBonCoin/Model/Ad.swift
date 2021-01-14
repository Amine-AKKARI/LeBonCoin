//
//  Ad.swift
//  LeBonCoin
//
//  Created by Amine on 1/14/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import Foundation
struct Ad: Codable, Equatable {
    /// Ad ID
    let advertisementId: Int
    /// Category ID
    let categoryId: Int
    /// Ad title
    let title: String
    /// Ad description
    let description: String
    /// Ad images
    let imagesUrl: ImagesUrl?
    /// Ad price
    let price: Double
    /// Ad creation date
    let creationDate: String
    /// ad urgent tag
    let isUrgent: Bool

    enum CodingKeys: String, CodingKey {
        case advertisementId = "id"
        case categoryId = "category_id"
        case title = "title"
        case description = "description"
        case imagesUrl = "images_url"
        case price = "price"
        case creationDate = "creation_date"
        case isUrgent = "is_urgent"
    }
}

struct ImagesUrl: Codable, Equatable {
    /// small image url string
    let small: String?
    /// thumb image url string
    let thumb: String?
}

