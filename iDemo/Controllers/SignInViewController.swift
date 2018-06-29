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
  @IBOutlet weak var rememberButton: UIButton!
  
  override func viewWillAppear(_ animated: Bool) {
    hideKeyboard()
  }
  
  @IBAction func loginButton(_ sender: UIButton) {
    let predicate = NSPredicate(format: "username MATCHES %@", username.text!)
    let check = SaveLoad.shared.checkCredentials(with: predicate, password: password.text!)
    if check == true{
      if rememberButton.isSelected{
        SaveLoad.shared.defaults.set(true, forKey: "isLogin")
      }
      SVProgressHUD.showSuccess(withStatus: "Login Successfull!")
      SaveLoad.shared.defaults.set(username.text!, forKey: "user")
      performSegue(withIdentifier: "toHome", sender: self)
    }
    else{
      SVProgressHUD.showError(withStatus: "Invalid Username or password")
    }
  }
  
  @IBAction func rememberBtn(_ sender: UIButton) {
    sender.isSelected = !sender.isSelected
  }
  
  @IBAction func signUpPressed(_ sender: UIButton) {
    if let viewsCounts = navigationController?.viewControllers.count{
      if viewsCounts >= 3{
        navigationController?.popViewController(animated: true)
      }
      else{
        performSegue(withIdentifier: "toSignUp", sender: self)
      }
    }
    else{
      performSegue(withIdentifier: "toSignUp", sender: self)
    }
  }
}
