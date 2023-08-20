//
//  NetWorkService.swift
//  RickAndMortyTestApp
//
//  Created by Otto Dzhandzhuliya on 18.08.2023.
//

import Foundation
import UIKit

class NetWorkService {
    
    static func getCharacters(page:Int,completion: @escaping(_ characters: [Result]) -> Void) {
        let url = "https://rickandmortyapi.com/api/character/?page=\(page)"
        guard let url = URL(string: url) else {
            return
        }
        let session = URLSession.shared
        session.dataTask(with: url) { data, _ , error in
            guard let data = data else {
                if let error = error {
                    print(error)
                }
                return
            }
            do {
                let characters = try JSONDecoder().decode(Character.self, from: data)
                completion(characters.results)
            }
            catch {
                print(error)
            }
        }.resume()
    }
    
    static func getEpisode(fetchUrl:String,completion: @escaping(_ episodes: Episode) -> Void) {
        let url = fetchUrl
        guard let url = URL(string: url) else {
            return
        }
        let session = URLSession.shared
        session.dataTask(with: url) { data, _ , error in
            guard let data = data else {
                if let error = error {
                    print(error)
                }
                return
            }
            do {
                let episode = try JSONDecoder().decode(Episode.self, from: data)
                completion(episode)
            }
            catch {
                print(error)
            }
        }.resume()
    }
}
