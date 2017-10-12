//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Xavier Morales on 25/01/15.
//  Copyright © 2015 Xavier Morales. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
   /* override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }*/
    
    //MARK foodTracker test
    
    // Tests to confirm that the Meal initializer returns when no name or a negative rating is provided.
    func testMealInitialization(){
        
        //Succes case
        
        
        
        let potentialItem = Meal(name: "Newest Meal", photo: nil, rating: 5 )
        XCTAssertNotNil(potentialItem)
        
        
        //Failure case
        
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is ivalid")
        
        let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)
        XCTAssertNotNil(badRating, "Negative ratings are invalid, be positive")
        
    }
    
}
