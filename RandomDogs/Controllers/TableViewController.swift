//
//  TableViewController.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 16.01.2022.
//

import UIKit

class FirstTableViewController: UITableViewController {
    
    var dogs: [DogDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "Cell", for: indexPath
        ) as! CustomTableViewCell
        
        cell.customize(with: dogs[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "VC2") as? DetailViewController else { return }
        func customize(with dog: DogDataModel) {
            if let data = dog.image {
                detailVC.detailImage = UIImage(data: data)
            }
            detailVC.dogDetailName = dog.title
        }
        customize(with: dogs[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let saleAction = UITableViewRowAction(
            style: .destructive,
            title: "Продать"
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

    private func setupNavigationBar() {
        title = "My Caterry"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navBarAppearance.backgroundColor = UIColor(displayP3Red: 146/255, green: 200/255, blue: 252/255, alpha: 255/255)
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.tintColor = .white
    }
}
