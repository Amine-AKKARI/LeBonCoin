//
//  AdCategory.swift
//  LeBonCoin
//
//  Created by Amine on 1/14/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import Foundation
struct AdCategory: Codable {
    /// category ID
    let categoryId: Int
    /// category NAme
    let categoryName: String
    
    enum CodingKeys: String, CodingKey {
        case categoryId = "id"
        case categoryName = "name"
    }
}
