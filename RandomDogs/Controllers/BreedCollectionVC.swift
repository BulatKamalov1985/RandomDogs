//
//  BreedCollectionVC.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 24.01.2022.
//

import UIKit

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

        setupNavigationBar(navTitle: "\(breedString.localizedUppercase)")

        collectionView.register(UINib(nibName: "BreedCell", bundle: nil), forCellWithReuseIdentifier: "BreedCell")
        
        NetworkManager.shared.fetchBreedDog(from: "https://dog.ceo/api/breed/\(breedString)/images") { [weak self] resultDogBreed in
            guard let dogsBreed = resultDogBreed else { return }
            print(dogsBreed.message.count)
            self?.dogsBreed = dogsBreed
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        messages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BreedCell", for: indexPath) as? BreedCell {
           
            cell.uploadImageFromUrl(messages[indexPath.row])
            cell.spinnerCell.stopAnimating()
       
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
