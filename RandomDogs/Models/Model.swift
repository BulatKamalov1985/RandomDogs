//
//  Model.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 12.01.2022.
//

struct DogsBreed: Codable {
    let message: [String?]
    let status: String
}

final class EndPointManager {

    static let shared = EndPointManager()

    // MARK: - Private (Properties)
    private let host = "https://dog.ceo/api/"

    // MARK: - Init
    private init() { }

    // MARK: - Public (Interface)
    func makeStringUrl(_ type: RequestType) -> String {
        switch type {
        case .random:
            return host + "breeds/image/random"
        case .breed(let sort):
            return host + "breed/\(sort)/images"
        case .wiki(let breed):
            return "https://en.wikipedia.org/wiki/\(breed)"
        }
    }
}

extension EndPointManager {

    // MARK: - RequestType
    enum RequestType {
        case random
        case breed(String = "beagle")
        case wiki(String)
    }
}

