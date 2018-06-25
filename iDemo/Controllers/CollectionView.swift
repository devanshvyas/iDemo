//
//  CollectionView.swift
//  iDemo
//
//  Created by devansh.vyas on 25/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit
import Kingfisher

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return imgUrls.count-1
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
    
    let url = imgUrls[indexPath.row+1]
    cell.cellImage.kf.setImage(with: url)
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = self.view.frame.size.width/2
    return CGSize(width: width, height: width)
  }
  

 }
