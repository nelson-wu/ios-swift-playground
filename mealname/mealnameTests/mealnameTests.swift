//
//  mealnameTests.swift
//  mealnameTests
//
//  Created by Nelson Wu on 2016-06-03.
//  Copyright © 2016 Nelson Wu. All rights reserved.
//

import XCTest

class mealnameTests: XCTestCase {
    
    // MARK: mealname Tests
    
    // Tests to confirm that the Meal initializer returns when no name or a negative rating is given
    func testMealInitialization(){
        // Success case
        let potentialItem = Meal(name: "Newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        // Failure cases
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
        let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)
        XCTAssertNil(badRating, "Negative ratings are invalid, be positive")
    }
    
    
}
