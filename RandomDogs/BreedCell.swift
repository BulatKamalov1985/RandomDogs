//
//  BreedCell.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 25.01.2022.
//

import UIKit

class BreedCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    
    
    func uploadImageFromUrlTwo(_ stringURL: String) {
        guard let url = URL(string: stringURL)
        else {
            print("somthing wrong")
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                guard let self = self else { return }
                guard let image = UIImage(data: data) else { return }
                print("ok")
                self.imageView.image = image
            }
        }.resume()
    }
}
