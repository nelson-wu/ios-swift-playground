//
//  Meal.swift
//  mealname
//
//  Created by Nelson Wu on 2016-06-03.
//  Copyright © 2016 Nelson Wu. All rights reserved.
//

import UIKit

class Meal{
    
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int){
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // Initialization should fail if there is no name or the rating is negative
        if name.isEmpty || rating < 0{
            return nil
        }
    }
}
