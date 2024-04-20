//
//  UIImageViewExt.swift
//  PanikaNews
//
//  Created by Irinka Datoshvili on 19.04.24.
//

import UIKit

extension UIImageView {
    func loadImage(from urlString: String) {
        if let cachedImage = ImageCache.shared.image(forKey: urlString) {
            self.image = cachedImage
            return
        }
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL for image: \(urlString)")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self,
                  let data = data,
                  error == nil,
                  let image = UIImage(data: data) else {
                print("Failed to load image from URL: \(urlString), error: \(error?.localizedDescription ?? "N/A")")
                return
            }
            
            DispatchQueue.main.async {
                ImageCache.shared.setImage(image, forKey: urlString)
                self.image = image
            }
        }.resume()
    }
}
