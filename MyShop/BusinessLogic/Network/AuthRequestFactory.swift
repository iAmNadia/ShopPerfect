//
//  AuthRequestFactory.swift
//  MyShop
//
//  Created by NadiaMorozova on 18.06.2019.
//  Copyright © 2019 NadiaMorozova. All rights reserved.
//

import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (DataResponse<LoginResult>) -> Void)
}
