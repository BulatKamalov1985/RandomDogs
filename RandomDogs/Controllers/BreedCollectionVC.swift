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
            breedStringForCapitalize = breedString
            breedStringForCapitalize.capitalizeFirstLetter()
            print("Такая вот порода " + breedString)
        }
    }
    
    var breedStringForCapitalize: String = ""
    
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
        
        
        setupNavigationBar()
            
        collectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        NetworkManager.shared.fetchBreedDog(from: "https://dog.ceo/api/breed/\(breedString)/images") { resultDogBreed in
            guard let dogsBreed = resultDogBreed else { return }
            print(dogsBreed.message.count)
            self.dogsBreed = dogsBreed
        }
    }
    
    private func setupNavigationBar() {
        title = "\(breedStringForCapitalize)"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navBarAppearance.backgroundColor = UIColor(displayP3Red: 146/255, green: 200/255, blue: 252/255, alpha: 255/255)
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.tintColor = .white
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? BreedCell {
            cell.uploadImageFromUrl(messages[indexPath.row])
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

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
