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
    
    let breeds = ["affenpinscher", "african", "airedale", "akita", "appenzeller", "australian", "shepherd", "basenji", "beagle", "bluetick", "borzoi", "bouvier", "boxer", "brabancon", "briard", "buhund", "norwegian", "bulldog", "bullterrier", "cattledog", "chihuahua", "chow", "clumber", "cockapoo", "collie", "coonhound", "corgi", "cotondetulear", "dachshund", "dalmatian", "dane", "dhole", "dingo", "doberman", "elkhound", "entlebucher", "eskimo", "finnish", "husky","keeshond","kelpie", "komondor", "kuvasz", "labradoodle", "labrador", "leonberg", "lhasa","malamute","malinois", "maltese", "mastiff","mexicanhairless", "mix", "mountain", "newfoundland", "otterhound", "ovcharka", "papillon", "pekinese", "pembroke", "pinscher"]
    
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        return breeds.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return breeds[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        breedChooseTF.text = breeds[row]
        breedString = breeds[row]
        breedChooseTF.resignFirstResponder()
    }
}
