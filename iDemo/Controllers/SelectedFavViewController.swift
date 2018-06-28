//
//  SelectedFavViewController.swift
//  iDemo
//
//  Created by devansh.vyas on 27/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit
import Kingfisher

class SelectedFavViewController: UIViewController {

  //MARK: Variables and Outlets
  var index: Int?
  var object: ImageDetail?
  
  @IBOutlet weak var selectedImage: UIImageView!
  @IBOutlet weak var tags: UILabel!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    if let obj = object{
      selectedImage.image = obj.image
      tags.text = obj.title
    }
    if let idx = index{
      selectedImage.kf.setImage(with: JsonData.shared.imageURL[idx])
      tags.text = JsonData.shared.imageTitle[idx]
    }
  }
  
}
