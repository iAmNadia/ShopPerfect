//
//  Goods.swift
//  MyShop
//
//  Created by NadiaMorozova on 23.06.2019.
//  Copyright © 2019 NadiaMorozova. All rights reserved.
//

import Alamofire

class Shopping: BaseRequestFactory, GoodsRequestFactory {
    func addToCart(idProduct: Int, quantity: Int, completionHandler: @escaping (DataResponse<SuccessResult>) -> Void) {
        let requestModel = Cart(baseUrl: baseUrl, idProduct: idProduct, quantity: quantity)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func getGoods(pageNumber: Int, idCategory: Int, completionHandler: @escaping (DataResponse<[GoodsResult]>) -> Void) {
        let requestModel = Catalog(baseUrl: baseUrl, pageNumber: pageNumber, idCategory: idCategory)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func getProduct(idProduct: Int, completionHandler: @escaping (DataResponse<Goods>) -> Void) {
        let requestModel = Product(baseUrl: baseUrl, idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}
extension Shopping {
    
    // MARK: - List of products request router
    struct Catalog: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "catalogData.json"
        
        let pageNumber: Int
        let idCategory: Int
        
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": idCategory
            ]
        }
    }
    struct Product: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getGoodById.json"
        
        let idProduct: Int
        
        var parameters: Parameters? {
            return [
                "id_product": idProduct
            ]
        }
    }
    struct Cart: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "addToBasket.json"
        
        let idProduct: Int
        let quantity: Int
        
        var parameters: Parameters? {
            return [
                "id_product": idProduct,
                "quantity": quantity
            ]
        }
    }
    
}

