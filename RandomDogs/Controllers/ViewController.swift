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
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var discriptionTF: UITextField!
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var viewCaterry: UIButton!
    
    var dogs1: [UIImage?] = [] {
        didSet {
            print(dogs1.count)
        }
    }
    
    var current: DogRandom? {
        willSet {
            
        }
    }
    
    var dogDiscriptions: [String?] = []
    var clouser2: Clouser2?
    var randomDog: DogRandom?
    var randomInt = Int.random(in: 1000...100000)
    let dogDescriptionList: [String] = ["Aктивный", "Aмбициозный", "Жаждущий внимания", "Жизнерадостный", "Творческий", "Любопытный", "Решительный", "Устремленный", "Энергичный", "Дружелюбный", "Тудолюбивый", "Полезный", "Скромный", "Терпеливый", "Застенчивый", "Серьезный", "Хвастливый", "Непредсказуемый", "Осторожный", "Приветливый", "Скучный", "Уравновешенный", "Непокорный", "Послушный", "Неряха"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.fetchRandomDog(from: URLS.urlStringRandom.rawValue) { DogRandomResult in
            guard let randomDog = DogRandomResult else { return }
            self.randomDog = randomDog
        }
        
        setupNavigationBar()
        
        imageDog.layer.masksToBounds = true
        imageDog.layer.cornerRadius = 12
      
        dogLabel.layer.masksToBounds = true
        dogLabel.layer.cornerRadius = 12
        
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        
        buyButton.layer.masksToBounds = true
        buyButton.layer.cornerRadius = 12
        
        detailButton.layer.masksToBounds = true
        detailButton.layer.cornerRadius = 12
        
        viewCaterry.layer.masksToBounds = true
        viewCaterry.layer.cornerRadius = 12
    }
    
    
    private func setupNavigationBar() {
        title = "My lovely dogs"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navBarAppearance.backgroundColor = UIColor(displayP3Red: 146/255, green: 200/255, blue: 252/255, alpha: 255/255)
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
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
    
    
    @IBAction func tappedButton(_ sender: UIButton) {
        uploadImageFromUrl(randomDog?.message)
        dogLabel.text = dogDescriptionList.randomElement()
        discriptionTF.text = ""
        buyButton.isHidden = false
        NetworkManager.shared.fetchRandomDog(from: URLS.urlStringRandom.rawValue) { DogRandomResult in
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
   
    @IBAction func addFromVCToTVC(_ sender: UIButton) {
        if discriptionTF.text == "" {
            discriptionTF.text = "Безымянная псина"
            if let image = imageDog.image, let title = discriptionTF.text {
                do {
                    try StorageManager.shared.createDogDataModel(
                        with: title,
                        image: image,
                        needToSave: true)
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        } else {
            if let image = imageDog.image, let title = discriptionTF.text {
                do {
                    try StorageManager.shared.createDogDataModel(
                        with: title,
                        image: image,
                        needToSave: true
                    )
                } catch {
                    print(error.localizedDescription)
                }
            }

        }
    
        if buyButton.isTouchInside == true {
            buyButton.isHidden = true
        } else {
            return
        }

       

        discriptionTF.text = ""
    }
    
    @IBAction func goToTableView(_ sender: UIButton) {
        guard let tableVC = storyboard?.instantiateViewController(
            withIdentifier: "tableVC"
        ) as? FirstTableViewController else { return }

        navigationController?.pushViewController(tableVC, animated: true)
    }
    
    
}

