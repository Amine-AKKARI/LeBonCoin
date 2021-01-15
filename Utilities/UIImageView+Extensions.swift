//
//  UIImageView+Extensions.swift
//  LeBonCoin
//
//  Created by Amine on 1/15/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import UIKit
let imageCache = NSCache<NSString, UIImage>()
extension UIImageView {
    func loadImageUsingCacheWithURLString(_ URLString: String, placeHolder: UIImage?) {
    self.image = placeHolder
    if let cachedImage = imageCache.object(forKey: NSString(string: URLString)) {
        self.image = cachedImage
        return
    }
        if let url = URL(string: URLString) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if error != nil {
                    DispatchQueue.main.async {
                        self.image = placeHolder
                    }
                    return
                }
                if let httpResponse = response as? HTTPURLResponse{
                    if httpResponse.statusCode != 200 {
                        DispatchQueue.main.async {
                            self.image = placeHolder
                        }
                        return
                    }
                }
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            imageCache.setObject(downloadedImage, forKey: NSString(string: URLString))
                            self.image = downloadedImage
                        }
                    }
                }
            }).resume()
        }
    }
}
