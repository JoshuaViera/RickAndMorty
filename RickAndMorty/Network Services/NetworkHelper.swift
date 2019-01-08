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
    
    func performDataTask(_ url: URL,_ completionHandler: @escaping  (Data?, Error?) -> Void) {
        self.session.dataTask(with: url) { (data, response, error) in
            guard let response = response as? HTTPURLResponse else { print("No reponse")
                return }
//            print(response.statusCode)
            
            guard let data = data else {return}
            
            completionHandler(data, error)
            }.resume()
    }
}
