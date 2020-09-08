//
//  UIImageViewExtension.swift
//  RickAndJamesTest
//
//  Created by Chrystian Salgado on 07/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func cacheImage(urlString: String) {
        let url = URL(string: urlString)
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.setImage(fade: true, image: imageFromCache)
            return
        }
        
        if let URL = url {
            URLSession.shared.dataTask(with: URL) { data, response, error in
                if let response = data {
                    DispatchQueue.main.async {
                        guard let imageToCache =  UIImage(data: response) else { return }
                        imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
                        self.setImage(fade: true, image: imageToCache)
                    }
                }
            }.resume()
        }
    }
    
    private func setImage(fade: Bool, image: UIImage?) {
        if fade {
            self.alpha = 0
            UIView.animate(withDuration: 0.5) {
                self.image = image
                self.alpha = 1
            }
        } else {
            self.image = image
        }
    }
}
