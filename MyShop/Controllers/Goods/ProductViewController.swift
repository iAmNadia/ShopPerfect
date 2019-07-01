//
//  ProductViewController.swift
//  MyShop
//
//  Created by NadiaMorozova on 23.06.2019.
//  Copyright © 2019 NadiaMorozova. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var stars: UILabel!
    @IBOutlet weak var prise: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descriptionName: UILabel!
    
    let requestFactory = RequestFactory()
    var productId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
getProudct()
    }
    
    func getProudct() {
        let product: GoodsRequestFactory = requestFactory.makeGoodsRequestFatory()
        product.getProduct(idProduct: productId) { response in
            switch response.result {
            case .success(let product):
                print(product)
                DispatchQueue.main.async {
                    self.name.text = product.product_name
                    self.prise.text = String(product.product_price)
                    self.descriptionName.text = product.product_description
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    @IBAction func addToBasket(_ sender: Any) {
        let basket: GoodsRequestFactory = requestFactory.makeGoodsRequestFatory()
        basket.addToCart(idProduct: productId, quantity: 1) { response in
            switch response.result {
            case .success(let addItemResult):
                print(addItemResult)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
    
   
