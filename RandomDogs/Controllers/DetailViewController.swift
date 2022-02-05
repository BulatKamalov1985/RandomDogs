//
//  DetailViewController.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 12.01.2022.
//

import UIKit



class DetailViewController: UIViewController {
    
    @IBOutlet weak var dogDetailNameLabel: UILabel! {
        didSet {
            dogDetailNameLabel.layer.masksToBounds = true
            dogDetailNameLabel.layer.cornerRadius = 12
        }
    }
    @IBOutlet weak var detailImageOutlet: UIImageView!
    
    var detailImage: UIImage?
    var dogDetailName: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        detailImageOutlet.image = detailImage
        dogDetailNameLabel.text = dogDetailName
    }
    
  
}
