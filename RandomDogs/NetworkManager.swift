//
//  NetworkManager.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 12.01.2022.
//

import Foundation

class NetworkManager {

    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchRandomDog(from url: String?, with completion: @escaping (DogRandom?) -> Void) {
        
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
                print("Have Error")
                return
            }
            
            guard let data = data else { return }
            
            do {
                let randomDog = try JSONDecoder().decode(DogRandom.self, from: data)
                DispatchQueue.main.async {
                    completion(randomDog)
                    print("Have Parsed")
                    print(randomDog.status ?? "")}
            } catch let error {
                print("Somthing Wrong")
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func fetchBreedDog(from url: String?, with completion: @escaping (DogsBreed?) -> Void) {
        
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
                print("Have Error")
                return
            }
            
            guard let data = data else { return }
            
            do {
                let dogsBreed = try JSONDecoder().decode(DogsBreed.self, from: data)
                DispatchQueue.main.async {
                    completion(dogsBreed)
                    print("Have Parsed")
                    print(dogsBreed.status )}
            } catch let error {
                print("Somthing Wrong")
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}


