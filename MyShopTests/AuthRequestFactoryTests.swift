//
//  AuthRequestFactoryTests.swift
//  MyShopTests
//
//  Created by NadiaMorozova on 22.06.2019.
//  Copyright © 2019 NadiaMorozova. All rights reserved.
//
import XCTest
@testable import MyShop

class AuthRequestFactoryTests: XCTestCase {
    
    var auth: AuthRequestFactory!
    
    override func setUp() {
        super.setUp()
        
        let factory = RequestFactory()
        auth = factory.makeAuthRequestFatory()
    }
    
    override func tearDown() {
        super.tearDown()
        
        auth = nil
        
    }
    
    func testLogin() {
        
        let exp = expectation(description: "")
        
        var userSession: LoginResult?
        auth.login(userName: "Somebody",
                   password: "mypassword"
        ) { result in
            userSession = result.value
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(userSession)
    }

}
