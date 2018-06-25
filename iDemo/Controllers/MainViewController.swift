//
//  ViewController.swift
//  iDemo
//
//  Created by devansh.vyas on 21/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

  @IBOutlet var mainView: UIView!
  override func viewDidLoad() {
    super.viewDidLoad()
    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.backgroundColor = UIColor.clear
    navigationController?.navigationBar.isTranslucent = true
  }
//
//  UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
//  // Sets shadow (line below the bar) to a blank image
//  UINavigationBar.appearance().shadowImage = UIImage()
//  // Sets the translucent background color
//  UINavigationBar.appearance().backgroundColor = .clear
//  // Set translucent. (Default value is already true, so this can be removed if desired.)
//  UINavigationBar.appearance().isTranslucent = true
}

