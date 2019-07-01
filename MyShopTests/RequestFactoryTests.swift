//
//  RequestfactoryTests.swift
//  MyShopTests
//
//  Created by NadiaMorozova on 22.06.2019.
//  Copyright © 2019 NadiaMorozova. All rights reserved.
//

import XCTest
@testable import MyShop

class RequestFactoryTests: XCTestCase {
    
    var requestFactory: RequestFactory? = nil
    
    override func setUp() {
        self.requestFactory =  RequestFactory()
      
    }
    
    override func tearDown() {
        self.requestFactory = nil
    
}

    func test_makeErrorParser() {
        let errorParser = self.requestFactory!.makeErrorParser() is AbstractErrorParser
        assert(errorParser, "requestFactory!.makeErrorParser() вернула не верный тип.")

    }
}
