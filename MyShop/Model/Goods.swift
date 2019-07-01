//
//  Goods.swift
//  MyShop
//
//  Created by NadiaMorozova on 23.06.2019.
//  Copyright © 2019 NadiaMorozova. All rights reserved.
//

import Foundation

struct Goods: Codable {
    let result: Int
    let product_name: String
    let product_price: Int
    let product_description: String
}

struct SuccessResult: Codable {
    let result: Int
}

    struct GoodsResult: Codable {
        let id: Int
        let name: String
        let price: Int
        //let photo: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price = "price"
        //case photo = ""
    }
}
