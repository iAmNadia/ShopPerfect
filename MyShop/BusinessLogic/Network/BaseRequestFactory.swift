//
//  BaseRequestFactory.swift
//  MyShop
//
//  Created by NadiaMorozova on 23.06.2019.
//  Copyright © 2019 NadiaMorozova. All rights reserved.
//

import Alamofire

class BaseRequestFactory: AbstractRequestFactory {
    
    // MARK: - Properties
    let errorParser: AbstractErrorParser
    let sessionManager: SessionManager
    let queue: DispatchQueue?
    let baseUrl: URL! = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")
    
    // MARK: - Initializers
    init (
        errorParser: AbstractErrorParser,
        sessionManager: SessionManager,
        queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}
