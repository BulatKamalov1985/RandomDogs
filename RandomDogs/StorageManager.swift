//
//  StorageManager.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 28.01.2022.
//

import Foundation
import CoreData
import UIKit

class StorageManager {
    
    static let shared = StorageManager()
   
     let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "RandomDogs")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private let viewContext: NSManagedObjectContext
    
    private init() {
        viewContext = persistentContainer.viewContext
    }
    
    
    func fetchData() {
        
    }
    
    // Save Data:
    func save() {
        
    }

}

