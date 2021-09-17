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
    
    func testValidApiCallGetsHTTPStatusCode200() throws {
        let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")
        let expectation = expectation(description: "Status Code: 200")
        session?.dataTask(with: url!, completionHandler: { _, response, error in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    expectation.fulfill()
                } else {
                    XCTFail("Status Code: \(statusCode)")
                }
            }
        }).resume()
        wait(for: [expectation], timeout: 5)
    }
    
    func testAPICallCompleted() throws {
        let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")
        let expectation = expectation(description: "Status Code: 200")
        var statusCode: Int?
        var responseError: Error?
        session?.dataTask(with: url!, completionHandler: { _, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            expectation.fulfill()
        }).resume()
        wait(for: [expectation], timeout: 5)
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
}

