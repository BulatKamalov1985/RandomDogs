//
//  BreedCollectionVC.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 24.01.2022.
//

import UIKit

private let reuseIdentifier = "BreedCell"

class BreedCollectionVC: UICollectionViewController {
    
    var breedString: String = "" {
        didSet {
            print("Такая вот порода " + breedString)
        }
    }
   
    var dogsBreed: DogsBreed? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var messages: [String] {
        dogsBreed?.message.compactMap { $0 } ?? []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        collectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        NetworkManager.shared.fetchBreedDog(from: "https://dog.ceo/api/breed/\(breedString)/images") { resultDogBreed in
            guard let dogsBreed = resultDogBreed else { return }
            print(dogsBreed.message.count)
            self.dogsBreed = dogsBreed
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? BreedCell {
            cell.uploadImageFromUrlTwo(messages[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    override func collectionView(_: UICollectionView, didSelectItemAt: IndexPath) {
        guard let webView = storyboard?.instantiateViewController(withIdentifier: "WebViewContoller") as? WebViewContoller else { return }
        webView.urlString = "https://en.wikipedia.org/wiki/\(breedString)"
        navigationController?.showDetailViewController(webView, sender: nil)
    }
}


