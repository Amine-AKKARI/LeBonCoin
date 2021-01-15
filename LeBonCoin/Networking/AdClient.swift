//
//  AdClient.swift
//  LeBonCoin
//
//  Created by Amine on 1/15/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import Foundation

class AdClient: APIClient {
    /**
     Class constructor
     - Parameter configuration: URLSessionConfiguration
     */
    let session: URLSession
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
   
    convenience init() {
        self.init(configuration: .default)
    }
    
    /**
    Get List of Ads
    - Parameter endPointType: EndPointType.
    - Parameter completion: Result<[Ad]?, APIError>.
    */
    func getAds(from endPointType: EndPointType, completion: @escaping (Result<[Ad]?, APIError>) -> Void) {
        let request = endPointType.request
        fetch(with: request, decode: { json -> [Ad]? in
            guard let ads = json as? [Ad] else {
                return  nil
            }
            return ads
        }, completion: completion)
    }
    
    /**
    Get List of Categories
    - Parameter endPointType: EndPointType.
    - Parameter completion: Result<[Ad]?, APIError>.
    */
    func getCategories(from endPointType: EndPointType, completion: @escaping (Result<[AdCategory]?, APIError>) -> Void) {
        let request = endPointType.request
        fetch(with: request, decode: { json -> [AdCategory]? in
            guard let categories = json as? [AdCategory] else {
                return  nil
            }
            return categories
        }, completion: completion)
    }
}
