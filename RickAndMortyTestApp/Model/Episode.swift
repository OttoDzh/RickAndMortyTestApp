//
//  Episode.swift
//  RickAndMortyTestApp
//
//  Created by Otto Dzhandzhuliya on 19.08.2023.
//

import Foundation

struct Episode: Codable {
    let name: String
    let characters: [String]
    let episode: String
    let air_date: String
}
