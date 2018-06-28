//
//  CollectionView.swift
//  iDemo
//
//  Created by devansh.vyas on 25/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit
import Kingfisher
import SVProgressHUD

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, LikeDelegate{
  
  //MARK: collection view delegates and data source
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return imgUrls.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
    let url = imgUrls[indexPath.row]
    
    DispatchQueue.main.async {
      cell.likeBtn.imageView?.tintColor = self.isFav[indexPath.row] ? UIColor.red : UIColor.white
    }
    
    
    debugPrint("Index:\(indexPath.row): \(isFav[indexPath.row])")
    
    cell.delegate = self
    cell.cellImage.kf.setImage(with: url)
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = self.view.frame.size.width/2
    return CGSize(width: width, height: width)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    performSegue(withIdentifier: "toSelectedFav", sender: self)
    
  }
  
  //MARK: navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toSelectedFav"{
      let destination = segue.destination as! SelectedFavViewController
      destination.index = collectionView.indexPathsForSelectedItems![0].row
    }
  }
  
  //MARK: Delegate method
  func likeAction(sender: CustomCollectionViewCell) {
    guard let index = collectionView.indexPath(for: sender) else {return}
    let check = SaveLoad.shared.checkImage(user: user!, id: JsonData.shared.imageId[index.row])
    if check == false{
      let newItem = Favourites(context: SaveLoad.shared.context)
      newItem.id = JsonData.shared.imageId[index.row] as NSDecimalNumber
      newItem.title = JsonData.shared.imageTitle[index.row]
      newItem.imageUrl = "\(JsonData.shared.imageURL[index.row])"
      newItem.images = userDetails!
      isFav[index.row] = true
      SaveLoad.shared.save()
      collectionView.reloadItems(at: [index])
    }
    else{
      isFav[index.row] = false
      let predicate = NSPredicate(format: "id == %@",NSDecimalNumber(decimal: JsonData.shared.imageId[index.row]))
      SaveLoad.shared.delete(with: predicate)
      collectionView.reloadItems(at: [index])
    }
  }
  
 }
