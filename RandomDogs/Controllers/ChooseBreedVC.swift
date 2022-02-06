//
//  ChooseBreedVC.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 26.01.2022.
//

import UIKit

class ChooseBreedVC: UIViewController {
    
    @IBOutlet weak var breedChooseTF: UITextField!
    
    var breedString: String = "" {
        didSet {
            passBreedToCollectionView()
        }
    }
    
    let breeds = BreedBank()
    
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar(navTitle: "Choose Breed")
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Собачий фон")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        breedChooseTF.inputView = pickerView
    }
    
    func passBreedToCollectionView() {
        guard let BreedCollectionVC = storyboard?.instantiateViewController(withIdentifier: "BreedCollectionVC") as? BreedCollectionVC else { return }
        BreedCollectionVC.breedString = breedString
        navigationController?.pushViewController(BreedCollectionVC, animated: true)
    }
    
   
}

extension ChooseBreedVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return breeds.breedList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return breeds.breedList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        breedChooseTF.text = breeds.breedList[row]
        breedString = breeds.breedList[row]
        breedChooseTF.resignFirstResponder()
    }
}
