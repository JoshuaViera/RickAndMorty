//
//  RickAndMortyApiManager.swift
//  RickAndMorty
//
//  Created by Joshua Viera on 1/2/19.
//  Copyright © 2019 Joshua Viera. All rights reserved.
//

import Foundation

class RickAndMortyApiManager {
    private init(){
    }
    
    static let manager = RickAndMortyApiManager()
    
    func getCharacters(completionHandler: @escaping (Error?, [RickAndMortyChar]? ) -> Void) {
        let urlString = "https://rickandmortyapi.com/api/character/"
        guard let url = URL(string: urlString) else {
            completionHandler("bad url: \(urlString)" as? Error, nil)
            return
        }
        URLSession.shared.dataTask(with: url){(data, response, error) in
            if let response = response {
                print("response code is \(response)")
            }
            if let error = error {
                completionHandler(error, nil)
            } else if let data = data {
                do {
                    let results = try JSONDecoder().decode(ResultsWrapper.self, from: data)
                    let characters = results.results
                   
                    completionHandler(nil, characters)
                }catch {
                   completionHandler(error, nil)
                }
            }
        }.resume()
//        let completion: (Data) -> (Void) = {(data: Data) in
        }
//        NetworkHelper.manager.performDataTask(url, completion,  )
    }



