//
//  HomeViewController.swift
//  iDemo
//
//  Created by devansh.vyas on 22/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit
import SVProgressHUD

class HomeViewController: UIViewController{
 
  var imgUrls = [URL]()

  @IBOutlet weak var mainImage: UIImageView!
  @IBOutlet weak var searchTextfield: UITextField!
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    UIApplication.shared.statusBarStyle = .lightContent
    let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
    if statusBar.responds(to: #selector(setter: UIView.backgroundColor)){
      statusBar.backgroundColor = UIColor(red: 12/255, green: 59/255, blue: 131/255, alpha: 0.8)
    }

    navigationItem.hidesBackButton = true
    navigationItem.rightBarButtonItem?.tintColor = UIColor.white
    navigationController?.navigationBar.backgroundColor = UIColor(red: 12/255, green: 59/255, blue: 131/255, alpha: 0.8)
//    navigationController?.navigationBar.alpha = 0.5
   
    JsonData.shared.networking(que: "Education"){
      self.imgUrls = JsonData.shared.imageURL
      self.mainImage.kf.setImage(with: self.imgUrls[0])
      self.collectionView.delegate = self
      self.collectionView.dataSource = self
   }
    self.collectionView.register(UINib.init(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
 }

  @IBAction func searchButton(_ sender: UIBarButtonItem) {
    searchTextfield.isHidden = false
    imgUrls.removeAll()
    searchTextfield.addTarget(self, action: #selector(self.textChanged(textField:)), for: .primaryActionTriggered)
  }
  
  @objc func textChanged(textField: UITextField) {
    SVProgressHUD.load()
    if let searchText: String = textField.text{
      let search = searchText.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
      JsonData.shared.networking(que: search){
        self.imgUrls = JsonData.shared.imageURL
        self.mainImage.kf.setImage(with: self.imgUrls[0])
        self.collectionView.reloadData()
        self.searchTextfield.isHidden = true
        SVProgressHUD.dismiss()
      }
    }
  }

}
