//
//  RegisterViewController.swift
//  MyShop
//
//  Created by NadiaMorozova on 19.06.2019.
//  Copyright © 2019 NadiaMorozova. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var loginText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var scroll: UIScrollView!
    
    @IBAction func registerButton(_ sender: Any) {
        guard let login = loginText.text, login.count > 0,
            let password = passwordText.text, password.count > 0 else {
        showLoginError()
    return
        }
    }
    
     var requestFactory: RequestFactory?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   
}
