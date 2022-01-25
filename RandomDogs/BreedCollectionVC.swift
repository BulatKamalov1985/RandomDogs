//
//  BreedCollectionVC.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 24.01.2022.
//

import UIKit

private let reuseIdentifier = "BreedCell"

class BreedCollectionVC: UICollectionViewController {
    
    var dogsBreed: DogsBreed?
    
    var dogBreedImage: UIImage? {
        didSet {
            print("dog")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)

        NetworkManager.shared.fetchBreedDog(from: "https://dog.ceo/api/breed/doberman/images") { resultDogBreed in
            guard let dogsBreed = resultDogBreed else { return }
            print(dogsBreed.message.count)
            self.dogsBreed = dogsBreed
        }
        
//        uploadImageFromUrlTwo(dogsBreed?.message.first)

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogsBreed?.message.count ?? 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) 
    
        return cell
    }
    
    func uploadImageFromUrlTwo(_ stringURL: String?) {
        guard let stringUrl = stringURL,
              let url = URL(string: stringUrl)
        else {
            print("tmr")
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                guard let image = UIImage(data: data) else { return }
                print("ok")
                self?.dogBreedImage = image
            }
        }.resume()
    }
}
