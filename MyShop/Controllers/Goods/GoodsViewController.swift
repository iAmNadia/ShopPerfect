//
//  GoodsViewController.swift
//  MyShop
//
//  Created by NadiaMorozova on 22.06.2019.
//  Copyright © 2019 NadiaMorozova. All rights reserved.
//
import Foundation
import UIKit

class GoodsViewController: UITableViewController  {
    
    let requestFactory = RequestFactory()
    //var catalog: [GoodsResult] = []
    var catalog: [GoodsResult] = [GoodsResult]()
    let identifier = "goodsCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let catalogFactory: GoodsRequestFactory = requestFactory.makeGoodsRequestFatory()
        
        catalogFactory.getGoods(pageNumber: 1, idCategory: 1) {
            [unowned self]
            response in
            switch response.result {
            case .success(let products):
                for product in products {
                    self.catalog.append(
                        GoodsResult(id: product.id,
                                    name: product.name,
                                    price: product.price)
                    )
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(90)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catalog.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? GoodsViewCell
        let item = self.catalog[indexPath.row]
        
        cell?.id.text = String(item.id)
        cell?.name.text = item.name
        cell?.price.text = "\(String(item.price)) ₽"
        // cell?.photo.image = UIImage(named: "head")
        guard let newCell = cell else {
            print(" product return - TableViewCell")
            return UITableViewCell()
        }
        
        return newCell
        
        
    }
}
