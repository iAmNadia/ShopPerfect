//
//  singleAlert.swift
//  MyShop
//
//  Created by NadiaMorozova on 19.06.2019.
//  Copyright © 2019 NadiaMorozova. All rights reserved.
//

import UIKit

extension UIViewController {

func showLoginError() {
    let alter = UIAlertController(title: "Ошибка", message: "Введены не корректные данные пользователя", preferredStyle: .alert)
    let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
    alter.addAction(action)
    present(alter, animated: true, completion: nil)
    }
}
