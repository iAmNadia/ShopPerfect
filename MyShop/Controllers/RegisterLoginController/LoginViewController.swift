//
//  ViewController.swift
//  MyShop
//
//  Created by NadiaMorozova on 14.06.2019.
//  Copyright © 2019 NadiaMorozova. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var shop: UILabel!
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var scroll: UIScrollView!
    
    var requestFactory = RequestFactory()
    var user = User.self
     var userData: LoginResult!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scroll?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @IBAction func entrance(_ sender: Any) {
        
//        guard let username = login.text, username.count > 0,
//            let password = password.text, password.count > 0 else {
              //  showLoginError()
               // return
        guard let userName = login.text else { return }
        guard let password = password.text else { return }
        
                let auth: AuthRequestFactory = requestFactory.makeAuthRequestFatory()
                auth.login(userName: userName, password: password) { response in
                    switch response.result {
                    case .success(let login):
                        self.userData = login
                        print(login)
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "showFromLogin", sender: self)
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
           }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    @objc func keyboardWasShown(notification: Notification) {
        
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        self.scroll?.contentInset = contentInsets
        scroll?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scroll?.contentInset = contentInsets
        scroll?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func hideKeyboard() {
        self.scroll?.endEditing(true)
    }
}

