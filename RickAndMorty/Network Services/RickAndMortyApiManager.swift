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
        let urlString = "https://rickandmortyapi.com/api/\(Endpoint.character)"
        guard let url = URL(string: urlString) else {
            completionHandler("bad url: \(urlString)" as? Error, nil)
            return
        }
        NetworkHelper.manager.session.dataTask(with: url){(data, response, error) in
            if let response = response {
//                print("response code is \(response)")
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

        }
    
    func getEpisodes(completionHandler: @escaping (Error?, [RickAndMortyEp]? ) -> Void) {
        let urlString = "https://rickandmortyapi.com/api/\(Endpoint.episode)"
        guard let url = URL(string: urlString) else {
            completionHandler("bad url: \(urlString)" as? Error, nil)
            return
        }
        NetworkHelper.manager.session.dataTask(with: url){(data, response, error) in
            if let response = response {
//                print("response code is \(response)")
            }
            if let error = error {
                completionHandler(error, nil)
            } else if let data = data {
                do {
                    let results = try JSONDecoder().decode(Results.self, from: data)
                    let episodes = results.results
                    completionHandler(nil, episodes)
                }catch {
                    completionHandler(error, nil)
                }
            }
            }.resume()
    }
    
//    func getPhotos(completionHandler: @escaping (Error?, [RickAndMortyEp]? ) -> Void) {
//        let urlString = "http://www.theodoregray.com/periodictable/Tiles/\(element.number)/s7.JPG"
//        guard let url = URL(string: urlString) else {
//            completionHandler("bad url: \(urlString)" as? Error, nil)
//            return
//        }
//        NetworkHelper.manager.session.dataTask(with: url){(data, response, error) in
//            if let response = response {
//                //                print("response code is \(response)")
//            }
//            if let error = error {
//                completionHandler(error, nil)
//            } else if let data = data {
//                do {
//                    let results = try JSONDecoder().decode(Results.self, from: data)
//                    let episodes = results.results
//                    completionHandler(nil, episodes)
//                }catch {
//                    completionHandler(error, nil)
//                }
//            }
//            }.resume()
//    }
    
    
}
