//
//  DetailViewController.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 12.01.2022.
//

import UIKit

typealias Closure = (String?) -> ()

class DetailViewController: UIViewController {
    
    @IBOutlet weak var dogDetailNameLabel: UILabel!
    @IBOutlet weak var detailImageOutlet: UIImageView!
    
    var detailImage: UIImage?
    var dogDetailName: String?
    var closure: Closure?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        detailImageOutlet.image = detailImage
        dogDetailNameLabel.text = dogDetailName
    }
    
  
}
