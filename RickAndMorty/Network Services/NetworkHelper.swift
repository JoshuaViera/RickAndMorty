//
//  NetworkHelper.swift
//  RickAndMorty
//
//  Created by Joshua Viera on 1/3/19.
//  Copyright © 2019 Joshua Viera. All rights reserved.
//

import Foundation

class NetworkHelper {
    private init () {
        
    }
    let session = URLSession(configuration: .default)
    
    static let manager = NetworkHelper()
    
    func performDataTask(_ url: URL,_ completionHandler: @escaping  (Data) -> (Void), _ errorHandler: @escaping (Error) -> Void ) {
        self.session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {return}
                
                if let error = error {
                    errorHandler(error)
                    return
                }
                completionHandler(data)
            }
            }.resume()
    }
}
