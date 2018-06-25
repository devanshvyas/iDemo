//
//  CustomCollectionViewCell.swift
//  iDemo
//
//  Created by devansh.vyas on 25/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var cellImage: UIImageView!
  @IBOutlet weak var widthConstraints: NSLayoutConstraint!
  
  override func awakeFromNib() {
        super.awakeFromNib()
     
    }

  @IBAction func likeButton(_ sender: UIButton) {
  }
}
