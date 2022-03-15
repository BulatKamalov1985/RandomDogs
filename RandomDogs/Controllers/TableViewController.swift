//
//  TableViewController.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 16.01.2022.
//

import UIKit

class CaterryViewController: UITableViewController {
    
    var dogs: [DogDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar(navTitle: "My Caterry".uppercased())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateDogs()
    }
    
    func updateDogs() {
        dogs = StorageManager.shared.fetchDogs()
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dogs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "Cell", for: indexPath
        ) as! CustomTableViewCell
        
        cell.customize(with: dogs[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = storyboard?.instantiateViewController(
            withIdentifier: DetailViewController.storyboardId
        ) as? DetailViewController else { return }

        let dog = dogs[indexPath.row]
        
        if let data = dog.image {
            detailVC.detailImage = UIImage(data: data)
        }
        
        detailVC.dogDetailName = dog.title

        navigationController?.pushViewController(detailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let saleAction = UITableViewRowAction(
            style: .destructive,
            title: "Sell" // Sell
        ) { [weak self] _, indexPath in
            guard let self = self else { return }
            
            do {
                try StorageManager.shared.delete(dog: self.dogs[indexPath.row])
                self.updateDogs()
            } catch {
                print(error.localizedDescription)
            }
        }
        
        return [saleAction]
    }
}
