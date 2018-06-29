//
//  Protocol.swift
//  iDemo
//
//  Created by devansh.vyas on 26/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit

protocol LikeDelegate {
  func likeAction(sender: CustomCollectionViewCell)
}

protocol TableCellLikeDelegate {
  func likePressed(sender: CustomTableViewCell, state: Bool)
}
