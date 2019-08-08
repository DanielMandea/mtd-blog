//
//  CoachDBConnectionTests.swift
//  ApplicationTests
//
//  Created by Daniel Mandea on 03/06/2019.
//

import XCTest
@testable import mtd-blog
@testable import Application

class CoachDBConnectionTests: XCTestCase {
    
    var sut: DefaultCouchDBConnection!

    override func setUp() {
        sut = DefaultCouchDBConnection(dbName: "some-db")
    }

    override func tearDown() {
        sut = nil
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
    }

}
