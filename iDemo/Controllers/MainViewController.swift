//
//  ViewController.swift
//  iDemo
//
//  Created by devansh.vyas on 21/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

  @IBOutlet var backView: UIView!
  @IBOutlet weak var stackView: UIStackView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    
    navBarStyle()
   backView.layer.cornerRadius = 8
  }
  
  override func viewWillAppear(_ animated: Bool) {
    navBarStyle()
  }
  
  func navBarStyle() {
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.backgroundColor = UIColor.clear
    navigationController?.navigationBar.isTranslucent = true
  }

}

