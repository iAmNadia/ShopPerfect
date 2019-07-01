//
//  ​AbstractErrorParser.swift
//  MyShop
//
//  Created by NadiaMorozova on 18.06.2019.
//  Copyright © 2019 NadiaMorozova. All rights reserved.
//

import Foundation
import Alamofire

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
