//
//  MyShopTests.swift
//  MyShopTests
//
//  Created by NadiaMorozova on 14.06.2019.
//  Copyright © 2019 NadiaMorozova. All rights reserved.
//

import XCTest
@testable import MyShop

class MyShopTests: XCTestCase {

    var text: String? = nil
    
    override func setUp() {
       self.text = "Test"
        print("setUp() :: \(self.text ?? "nil")")
    }

    override func tearDown() {
        self.text = nil
        print("tearDown()  :: \(self.text ?? "nil")")
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
