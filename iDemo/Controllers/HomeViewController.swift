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
 
  //MARK: Variables
  var imgUrls = [URL]()
  var imgId: [Decimal]?{
    didSet{
      isSelected()
    }
  }
//  var like = [Favourites]()
  var user = SaveLoad.shared.defaults.string(forKey: "user")
  var isFav = [Bool]()
  
  //MARK: Outlets
  @IBOutlet weak var mainImage: UIImageView!
  @IBOutlet weak var searchTextfield: UITextField!
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    SVProgressHUD.load()
    UIApplication.shared.statusBarStyle = .lightContent
    let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
    if statusBar.responds(to: #selector(setter: UIView.backgroundColor)){
      statusBar.backgroundColor = UIColor(red: 12/255, green: 59/255, blue: 131/255, alpha: 0.8)
    }
    navigationItem.hidesBackButton = true
    navigationController?.navigationBar.tintColor = UIColor.white
    navigationController?.navigationBar.backgroundColor = UIColor(red: 12/255, green: 59/255, blue: 131/255, alpha: 0.8)
   
    JsonData.shared.networking(que: "Education"){
      self.imgUrls = JsonData.shared.imageURL
      self.imgId = JsonData.shared.imageId
      self.mainImage.kf.setImage(with: self.imgUrls[0])
      self.collectionView.delegate = self
      self.collectionView.dataSource = self
//      self.isSelected()
      self.collectionView.reloadData()
    }
//    like = SaveLoad.shared.loadFavData()
    self.collectionView.register(UINib.init(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
 }
  override func viewWillAppear(_ animated: Bool) {
    collectionView.reloadData()
  }
  //MARK: Search Button
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
        self.isSelected()
        self.searchTextfield.isHidden = true
        SVProgressHUD.dismiss()
      }
    }
  }
  
  //MARK: isSelected
  func isSelected(){
    if let id = imgId{
      for (index,_) in imgId!.enumerated(){
        let check = SaveLoad.shared.checkImage(user: user!, id: id[index])
        check == true ? isFav.append(true) : isFav.append(false)
       }
      SVProgressHUD.dismiss()
      collectionView.reloadData()
      print(isFav)
    }
  }

}
