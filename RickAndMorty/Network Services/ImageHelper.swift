//
//  ImageHelper.swift
//  RickAndMorty
//
//  Created by Joshua Viera on 1/7/19.
//  Copyright © 2019 Joshua Viera. All rights reserved.
//

import UIKit




public final class ImageHelper {
    // Singleton instance to have only one instance in the app of the imageCache
    private init() {
        imageCache = NSCache<NSString, UIImage>()
        imageCache.countLimit = 100 // number of objects
        imageCache.totalCostLimit = 10 * 1024 * 1024 // max 10MB used
    }
    public static let shared = ImageHelper()
    
    private var imageCache: NSCache<NSString, UIImage>
    
    public func fetchImage(urlString: String, completionHandler: @escaping (UIImage?, AppError?) -> Void) {
        guard let url = URL(string: urlString) else {
            completionHandler(nil,AppError.badURL(urlString))
            return}
        
        if let cachedImage =  imageCache.object(forKey: NSString(string: urlString)) {
            completionHandler(cachedImage, nil)
            return
        }
        
        NetworkHelper.manager.performDataTask(url) { (data, error) in
            
            guard let data = data else { completionHandler(nil, AppError.networkError(error!))
                return
            }
            
            guard let image = UIImage(data: data) else { completionHandler(nil, AppError.badImageData)
                return
            }
            self.imageCache.setObject(image, forKey: NSString(string: urlString))
            completionHandler(image, nil)
        }
    }
}
