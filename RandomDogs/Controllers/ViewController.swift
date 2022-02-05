//
//  ViewController.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 12.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageDog: UIImageView! {
        didSet {
            imageDog.layer.masksToBounds = true
            imageDog.layer.cornerRadius = 12
        }
    }
    
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.layer.masksToBounds = true
            descriptionLabel.layer.cornerRadius = 12
        }
    }
    @IBOutlet weak var getRandomDogButton: UIButton! {
        didSet {
            getRandomDogButton.layer.masksToBounds = true
            getRandomDogButton.layer.cornerRadius = 12
        }
    }
    @IBOutlet weak var dogsNameTF: UITextField! {
        didSet {
            dogsNameTF.layer.masksToBounds = true
            dogsNameTF.layer.cornerRadius = 12
        }
    }
    
    @IBOutlet weak var detailButton: UIButton! {
        didSet {
            detailButton.layer.masksToBounds = true
            detailButton.layer.cornerRadius = 12
        }
    }
    @IBOutlet weak var buyButton: UIButton! {
        didSet {
            buyButton.layer.masksToBounds = true
            buyButton.layer.cornerRadius = 12
        }
    }
    @IBOutlet weak var viewCaterry: UIButton! {
        didSet {
            viewCaterry.layer.masksToBounds = true
            viewCaterry.layer.cornerRadius = 12
        }
    }
    
    var dogRandom: DogRandom?
    
    let dogDescriptionList: [String] = ["Aктивный", "Aмбициозный", "Жаждущий внимания", "Жизнерадостный", "Творческий", "Любопытный", "Решительный", "Устремленный", "Энергичный", "Дружелюбный", "Тудолюбивый", "Полезный", "Скромный", "Терпеливый", "Застенчивый", "Серьезный", "Хвастливый", "Непредсказуемый", "Осторожный", "Приветливый", "Скучный", "Уравновешенный", "Непокорный", "Послушный", "Неряха"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Собачий фон")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        fetchRandomDogFromNetworkManager()
        setupNavigationBar()
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
    
    private func uploadImageFromUrl(_ stringUrl: String?) {
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
    
    private func fetchRandomDogFromNetworkManager() {
        NetworkManager.shared.fetchRandomDog(from: URLS.urlStringRandom.rawValue) { DogRandomResult in
            guard let randomDog = DogRandomResult else { return }
            self.dogRandom = randomDog
        }
    }
    
    private func createDogDataModelFromStorageManager() {
        if let image = imageDog.image, let title = dogsNameTF.text {
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
        fetchRandomDogFromNetworkManager()
        uploadImageFromUrl(dogRandom?.message)
        descriptionLabel.text = dogDescriptionList.randomElement()
        dogsNameTF.text = ""
        buyButton.isHidden = false
    }
    
    @IBAction func detailButtonAction(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "VC2") as? DetailViewController else { return }
        detailVC.detailImage = imageDog.image
        detailVC.dogDetailName = descriptionLabel.text
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @IBAction func addFromVCToTVC(_ sender: UIButton) {
        if dogsNameTF.text == "" {
            dogsNameTF.text = "Безымянная собака"
            createDogDataModelFromStorageManager()
        } else {
            createDogDataModelFromStorageManager()
        }
        
        if buyButton.isTouchInside == true {
            buyButton.isHidden = true
        } else {
            return
        }
        dogsNameTF.text = ""
    }
    
    @IBAction func goToTableView(_ sender: UIButton) {
        guard let tableVC = storyboard?.instantiateViewController(
            withIdentifier: "tableVC"
        ) as? FirstTableViewController else { return }
        
        navigationController?.pushViewController(tableVC, animated: true)
    }
    
}

