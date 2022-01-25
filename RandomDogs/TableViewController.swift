//
//  TableViewController.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 16.01.2022.
//

import UIKit


class FirstTableViewController: UITableViewController {
    
    var dogs: [UIImage?] = []
    var dogDescription2: [String?] = []
    var imageTVC: UIImage?
    var textAboutDog: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.reloadData()
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
}
