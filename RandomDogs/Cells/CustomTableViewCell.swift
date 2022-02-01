//
//  CustomTableViewCell.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 20.01.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCustomCell: UIImageView!
    @IBOutlet weak var labelCustomCell: UILabel!
    
    func customize(with dog: DogDataModel) {
        imageCustomCell.layer.cornerRadius = imageCustomCell.frame.height / 2
        imageCustomCell.contentMode = .scaleToFill
        imageCustomCell.clipsToBounds = true

        if let data = dog.image {
            imageCustomCell.image = UIImage(data: data)
        }
        labelCustomCell.text = dog.title
    }
}
