//
//  TableViewController.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 16.01.2022.
//

import UIKit
import CoreData

class FirstTableViewController: UITableViewController {
    
    private let context = (UIApplication.shared.delegate as! StorageManager).persistentContainer.viewContext

    
    var dogs: [UIImage?] = []
    var dogDescription2: [String?] = []
    var imageTVC: UIImage?
    var textAboutDog: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.imageCustomCell.image = dogs[indexPath.row]
        cell.labelCustomCell.text = dogDescription2[indexPath.row]
        cell.imageCustomCell.layer.cornerRadius = cell.imageCustomCell.frame.height / 2
        cell.imageCustomCell.contentMode = .scaleToFill
        cell.imageCustomCell.clipsToBounds = true
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "VC2") as? DetailViewController else { return }
        detailVC.detailImage = dogs[indexPath.row]
        detailVC.dogDetailName = dogDescription2[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let saleAction = UITableViewRowAction(style: .destructive, title: "Продать") { _, indexPath in
            self.dogs.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
       return [saleAction]
    }
    
    private func save() {
        guard  let entityDescription = NSEntityDescription.entity(forEntityName: "FavoriteDog", in: context) else { return }
        
    }
    
    private func setupNavigationBar() {
        title = "My Caterry"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navBarAppearance.backgroundColor = UIColor(displayP3Red: 21/255, green: 101/255, blue: 192/255, alpha: 194/255)
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.tintColor = .white

    }
    
}
