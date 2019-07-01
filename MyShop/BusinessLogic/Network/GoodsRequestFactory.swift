//
//  GoodsrequestFactiry.swift
//  MyShop
//
//  Created by NadiaMorozova on 23.06.2019.
//  Copyright © 2019 NadiaMorozova. All rights reserved.
//

import Alamofire

protocol GoodsRequestFactory {

func getGoods (
    pageNumber: Int,
    idCategory: Int,
    completionHandler: @escaping (DataResponse<[GoodsResult]>) -> Void)
    
    func getProduct(
        idProduct: Int,
        completionHandler: @escaping (DataResponse<Goods>) -> Void)
    
    func addToCart(
        idProduct: Int,
        quantity: Int,
        completionHandler: @escaping (DataResponse<SuccessResult>) -> Void)
    
    
}
