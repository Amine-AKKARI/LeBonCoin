//
//  UtilsTests.swift
//  LeBonCoinTest
//
//  Created by Amine on 1/15/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import Foundation

class UtilsTests {
    static func jsonData(filename: String) -> Data? {
        do {
            let testBundle = Bundle(for: self)
            if let file =  testBundle.url(forResource: filename, withExtension: "json") {
                let data = try Data(contentsOf: file)
                
                return data
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    static func string(from filename: String, withExtension: String) -> String? {
        do {
            let testBundle = Bundle(for: self)
            if let file = testBundle.url(forResource: filename, withExtension: withExtension) {
                return try String(contentsOf: file, encoding: .utf8)
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}

