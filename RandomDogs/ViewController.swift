//
//  ViewController.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 12.01.2022.
//

import UIKit

typealias Clouser2 = ([UIImage]) -> [UIImage]

class ViewController: UIViewController {
    
    @IBOutlet weak var imageDog: UIImageView!
    @IBOutlet weak var dogLabel: UILabel!
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var discriptionTF: UITextField!
    
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var buyButton: UIButton!
    
    
    var dogs1: [UIImage?] = [] {
        didSet {
            print(dogs1.count)
        }
    }
    
    var dogDiscriptions: [String?] = []
    var clouser2: Clouser2?
    var randomDog: DogRandom?
    var randomInt = Int.random(in: 1000...100000)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dogLabel.layer.masksToBounds = true
        dogLabel.layer.cornerRadius = 12
        
        Button.layer.masksToBounds = true
        Button.layer.cornerRadius = 12
        
        detailButton.layer.masksToBounds = true
        detailButton.layer.cornerRadius = 12
    }
    
    @IBAction func tappedButton(_ sender: UIButton) {
        let randomInt = Int.random(in: 1000...100000)
        uploadImageFromUrl(randomDog?.message)
        dogLabel.text = (String(randomInt)+" "+"руб.")
        discriptionTF.text = ""
        buyButton.isHidden = false
        
        NetworkManager.shared.fetchRandomDog(from: "https://dog.ceo/api/breeds/image/random") { DogRandomResult in
            guard let randomDog = DogRandomResult else { return }
            self.randomDog = randomDog
        }
    }
    
    @IBAction func detailButtonAction(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "VC2") as? DetailViewController else { return }
        detailVC.detailImage = imageDog.image
        detailVC.closure = {[weak self] text in
            self?.dogLabel.text = text
        }
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func uploadImageFromUrl(_ stringUrl: String?) {
        guard let stringUrl = stringUrl,
              let url = URL(string: stringUrl)
        else {
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                guard let image = UIImage(data: data) else { return }
                self?.imageDog.image = image
            }
        }.resume()
    }
    
    @IBAction func addFromVCToTVC(_ sender: UIButton) {
        if discriptionTF.text == "" {
            dogDiscriptions.append("Безимянная псина")
        } else {
            dogDiscriptions.append(discriptionTF.text)
        }
        
        dogs1.append(imageDog.image)
    
        discriptionTF.text = ""
        
        if buyButton.isTouchInside == true {
            buyButton.isHidden = true
        } else {
            return
        }
    }
    
    @IBAction func goToTableView(_ sender: UIButton) {
        guard let tableVC = storyboard?.instantiateViewController(withIdentifier: "tableVC") as? FirstTableViewController else { return }
        tableVC.dogs = dogs1
        tableVC.dogDescription2 = dogDiscriptions
        navigationController?.pushViewController(tableVC, animated: true)
    }
    
}
