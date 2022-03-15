//
//  SetNavBarManager.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 06.02.2022.
//

import UIKit

extension UIViewController {
    func setupBackgroundImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Собачий фон")
        backgroundImage.alpha = 0.15
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
    }
    
    func setupNavigationBar(navTitle: String?) {
        title = navTitle
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
        appearance.backgroundColor = UIColor(displayP3Red: 146/255, green: 200/255, blue: 252/255, alpha: 255/255)
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .white
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

extension UIView {
    func roundedStyle() {
        layer.masksToBounds = true
        layer.cornerRadius = 12
    }
}
