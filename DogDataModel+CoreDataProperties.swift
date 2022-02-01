//
//  DogDataModel+CoreDataProperties.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 29.01.2022.
//
//

import Foundation
import CoreData


extension DogDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DogDataModel> {
        return NSFetchRequest<DogDataModel>(entityName: "DogDataModel")
    }

    @NSManaged public var image: Data?
    @NSManaged public var title: String?

}

extension DogDataModel : Identifiable {

}
