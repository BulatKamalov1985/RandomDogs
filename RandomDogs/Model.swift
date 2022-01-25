//
//  Model.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 12.01.2022.
//

import Foundation

struct DogRandom: Codable {
    let message: String?
    let status: String?
}

struct DogsBreed: Codable {
    let message: [String?]
    let status: String
}

