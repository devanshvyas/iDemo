//
//  CustomTableViewCell.swift
//  iDemo
//
//  Created by devansh.vyas on 27/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

  //MARK: Variables and Outlets
  var delegate: TableCellLikeDelegate?
  var state = false
  
  @IBOutlet weak var favImage: UIImageView!
  @IBOutlet weak var likeButton: UIButton!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    }

  @IBAction func likeButtonPressed(_ sender: UIButton) {
    if sender.isSelected == false{
      sender.isSelected = !sender.isSelected
      delegate?.likePressed(sender: self,state: sender.isSelected)
    }
    else{
      sender.isSelected = !sender.isSelected
      delegate?.likePressed(sender: self,state: sender.isSelected)
    }
  }
  
}
