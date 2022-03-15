//
//  ViewController.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 12.01.2022.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var randomDogButton: UIButton!
    @IBOutlet weak var dogNameTextFiled: UITextField!
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var catteryButton: UIButton!
    
    var dogRandom: DogRandom?
    var dogDescription = DescriptionDogsBank()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewsStyle()
        setupBackgroundImage()
        uploadRandomDog()
        setupNavigationBar(navTitle: "My lovely dogs".uppercased())
    }

    private func setupViewsStyle() {
        dogImageView.roundedStyle()
        descriptionLabel.roundedStyle()
        randomDogButton.roundedStyle()
        dogNameTextFiled.roundedStyle()
        detailButton.roundedStyle()
        buyButton.roundedStyle()
        catteryButton.roundedStyle()
    }

    private func uploadRandomDog() {
        NetworkManager.shared.fetchRandomDog(
            from: EndPointManager.shared.makeStringUrl(.random)
        ) {
            [weak self] dogRandom in
            guard let dogRandom = dogRandom else { return }
            self?.dogRandom = dogRandom
        }
    }

    private func saveDogDataModel() {
        if let image = dogImageView.image, let title = dogNameTextFiled.text {
            do {
                try StorageManager.shared.createDogDataModel(
                    with: title,
                    image: image,
                    needToSave: true)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func tappedButton(_ sender: UIButton) {
        uploadRandomDog()
        NetworkManager.shared.uploadImage(dogRandom?.message) { image in
            self.dogImageView.image = image
        }
        descriptionLabel.text = dogDescription.dogDescriptionList.randomElement()
        dogNameTextFiled.text = ""
        buyButton.isHidden = false
    }
    
    @IBAction func detailButtonAction(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: DetailViewController.storyboardId) as? DetailViewController else { return }
        detailVC.detailImage = dogImageView.image
        detailVC.dogDetailName = descriptionLabel.text
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @IBAction func addFromVCToTVC(_ sender: UIButton) {
        if dogNameTextFiled.text == "" {
            dogNameTextFiled.text = "Безымянная собака"
            saveDogDataModel()
        } else {
            dogNameTextFiled.text?.capitalizeFirstLetter()
            saveDogDataModel()
        }
        
        if buyButton.isTouchInside == true {
            buyButton.isHidden = true
        } else {
            return
        }
        dogNameTextFiled.text = ""
    }
    
    @IBAction func goToTableView(_ sender: UIButton) {
        guard let tableVC = storyboard?.instantiateViewController(
            withIdentifier: "tableVC"
        ) as? CaterryViewController else { return }
        
        navigationController?.pushViewController(tableVC, animated: true)
    }
}
