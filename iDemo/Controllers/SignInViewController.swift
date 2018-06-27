//
//  SignInViewController.swift
//  iDemo
//
//  Created by devansh.vyas on 22/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit
import SVProgressHUD

class SignInViewController: UIViewController {

  //MARK: outlets
  @IBOutlet weak var username: UITextField!
  @IBOutlet weak var password: UITextField!
  override func viewDidLoad() {
        super.viewDidLoad()
     
    }

  @IBAction func loginButton(_ sender: UIButton) {
    let predicate = NSPredicate(format: "username MATCHES %@", username.text!)
    let check = SaveLoad.shared.checkCredentials(with: predicate, password: password.text!)
    if check == true{
      SVProgressHUD.showSuccess(withStatus: "Login Successfull!")
      SaveLoad.shared.defaults.set(true, forKey: "isLogin")
      SaveLoad.shared.defaults.set(username.text!, forKey: "user")
      performSegue(withIdentifier: "toHome", sender: self)
    }
    else{
      SVProgressHUD.showError(withStatus: "Invalid Username or password")
    }
  }
  
  
}
