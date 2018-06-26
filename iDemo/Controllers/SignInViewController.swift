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

  //MARK: variables
  var userDetail: UserData?
  //MARK: outlets
  @IBOutlet weak var username: UITextField!
  @IBOutlet weak var password: UITextField!
  override func viewDidLoad() {
        super.viewDidLoad()
     
    }

  @IBAction func loginButton(_ sender: UIButton) {
    let predicate = NSPredicate(format: "username MATCHES %@", username.text!)
    let (check,user) = SaveLoad.shared.checkCredentials(with: predicate, password: password.text!)
    if check == true{
      SVProgressHUD.showSuccess(withStatus: "Login Successfull!")
      userDetail = user
      SaveLoad.shared.defaults.set(true, forKey: "isLogin")
      SaveLoad.shared.defaults.set(userDetail?.username!, forKey: "user")
      performSegue(withIdentifier: "toHome", sender: self)
    }
    else{
      SVProgressHUD.showError(withStatus: "Invalid Username or password")
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destination = segue.destination as! HomeViewController
    //destination.userDetails = userDetail
  }
}
