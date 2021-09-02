//
//  HighSchoolList_DemoTests.swift
//  HighSchoolList_DemoTests
//
//  Created by Shak Feizi on 8/10/21.
//

import XCTest
import CoreData
@testable import NYCHighSchoolList

class NYCHighSchoolListTests: XCTestCase {
    // Shak notes: Properties
    var session: URLSession?
    
    // Before each test gets called this function check if there is an error then it throws it.
    override func setUpWithError() throws {
        try super.setUpWithError()
        session = URLSession(configuration: .default)
    }
    
    // After each test it gets called and if it finds any error it stops the test and tear it down
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        session = nil
    }
    
    // API call
    func testValidApiCallGetsHTTPStatusCode200() throws {
        let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json")!
        let expectation = expectation(description: "Status Code: 200")
        session?.dataTask(with: url, completionHandler: { _, response, error in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    // Fullfill() -> it represents that expectation has met
                    expectation.fulfill()
                } else {
                    XCTFail("Status Code: \(statusCode)")
                }
            }
        }).resume()
        // Keeps test running until all expectations are fullfilled
        wait(for: [expectation], timeout: 5)
    }
    
    // Nil value
    func testObjectForNilValue() {
        let schoolController = HighSchoolController()
        XCTAssert(schoolController.highSchool?.school_name == nil)
        XCTAssert(schoolController.highSchool?.num_of_sat_test_takers == nil)
    }
    
    // Upercase
    func testLabelsForUpercaseValue(value: HighSchool) {
        let schoolDVC = DetailViewController()
        XCTAssertFalse(schoolDVC.highSchoolLabel.text == schoolDVC.highSchool?.school_name?.uppercased())
    }
    
    // CoreData
    
}

