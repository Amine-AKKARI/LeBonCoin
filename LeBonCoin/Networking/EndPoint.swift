//
//  EndPoint.swift
//  LeBonCoin
//
//  Created by Amine on 1/15/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
}

extension Endpoint {
    /// get URL Components
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        return components
    }
    
    /// Create Requelst from  url components
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}

/// EndPoint types enum
enum EndPointType {
    case ads
    case categories
}

extension EndPointType: Endpoint {
    var base: String {
        return "https://raw.githubusercontent.com"
    }
    
    /// get path depend on endpoint type
    var path: String {
        switch self {
        case .ads: return "/leboncoin/paperclip/master/listing.json"
        case .categories: return "/leboncoin/paperclip/master/categories.json"
        }
    }
}

