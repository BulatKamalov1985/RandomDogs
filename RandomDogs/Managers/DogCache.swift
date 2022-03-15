//
//  DogCache.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 27.01.2022.
//

import UIKit

final class DogCache: NSCache<AnyObject, AnyObject> {
    
    static let shared = DogCache()
    
    private override init(){}
    
    lazy var cache = NSCache<NSString, UIImage>() {
        didSet {
            print("Cache save")
        }
    }
}
