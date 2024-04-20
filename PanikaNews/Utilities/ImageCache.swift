//
//  ImageCache.swift
//  PanikaNews
//
//  Created by Irinka Datoshvili on 19.04.24.
//

import Foundation
import UIKit

class ImageCache {
    
    static let shared = ImageCache()
    private init() {}
    
    var cache = NSCache<NSString, UIImage>()
    
    func image(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
}
