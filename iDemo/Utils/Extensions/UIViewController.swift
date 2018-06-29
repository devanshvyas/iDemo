//
//  UIViewController.swift
//  iDemo
//
//  Created by devansh.vyas on 29/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit

extension UIViewController{
  
  //MARK: to Hide Keyboard
  func hideKeyboard() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
  @objc func dismissKeyboard(){
    view.endEditing(true)
  }
  
}
