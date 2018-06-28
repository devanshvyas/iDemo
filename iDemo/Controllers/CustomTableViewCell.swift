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
  
  @IBOutlet weak var favImage: UIImageView!
  @IBOutlet weak var likeButton: UIButton!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    }

  
  @IBAction func likeButtonPressed(_ sender: UIButton) {
    delegate?.likePressed(sender: self)
  }
  
}
