//
//  String+Extensions.swift
//  LeBonCoin
//
//  Created by Amine on 1/15/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import Foundation
public extension String {
    func getDateFromString (format: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: self) else {return Date()}
        return date
    }
    
    
    func convertDateToFormat(endformat: String, initialFormat: String) -> String {
        let date = getDateFromString(format: initialFormat)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = endformat
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}

