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

enum URLS: String {
    case urlStringRandom = "https://dog.ceo/api/breeds/image/random"
    case urlStringBreed = "https://dog.ceo/api/breed/beagle/images"
}

