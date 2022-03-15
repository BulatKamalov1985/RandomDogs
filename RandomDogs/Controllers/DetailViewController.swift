//
//  DetailViewController.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 12.01.2022.
//

import UIKit

class DetailViewController: UIViewController {

    static let storyboardId = String(describing: DetailViewController.self)
    
    @IBOutlet weak var nameLabel: UILabel! 
    @IBOutlet weak var detailImageOutlet: UIImageView!
    @IBOutlet weak var halthyLabel: UILabel!
    @IBOutlet weak var hangryLabel: UILabel!
    var detailImage: UIImage?
    var dogDetailName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(navTitle: "Detail dog".uppercased())
        nameLabel.roundedStyle()
        halthyLabel.roundedStyle()
        hangryLabel.roundedStyle()
        detailImageOutlet.image = detailImage
        nameLabel.text = dogDetailName
    }
}
