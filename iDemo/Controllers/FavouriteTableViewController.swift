//
//  FavouriteTableViewController.swift
//  iDemo
//
//  Created by devansh.vyas on 27/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit
import Kingfisher

class FavouriteTableViewController: UITableViewController , TableCellLikeDelegate{
 
  //MARK: Variables
  var favArray = SaveLoad.shared.loadFavUserImage(user: SaveLoad.shared.defaults.string(forKey: "user")!)
  var imageDetail = [ImageDetail]()
  var referenceArray: [Favourites]?
  var deleteCount = 0
  
  override func viewDidLoad() {
      super.viewDidLoad()
    referenceArray = favArray
  }

  override func viewWillDisappear(_ animated: Bool) {
    SaveLoad.shared.save()
  }
  
  // MARK: - Table view data source and delegates
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return favArray.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! CustomTableViewCell
    cell.delegate = self
    cell.favImage.kf.setImage(with: URL(string: favArray[indexPath.row].imageUrl ?? "https://pixabay.com/en/false-error-missing-absent-x-red-2061132/")){ (image, error, cache, url) in
      let object = ImageDetail()
      object.image = cell.favImage.image!
      object.title = self.favArray[indexPath.row].title
      self.imageDetail.append(object)
    }
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "toSelectedFav", sender: self)
  }
  
  //MARK: to delete in Fav List
  func likePressed(sender: CustomTableViewCell, state: Bool) {
    if let index = tableView.indexPath(for: sender){
      if state{
        SaveLoad.shared.context.delete(favArray[index.row - deleteCount])
        favArray.remove(at: index.row - deleteCount)
        deleteCount += 1
      }
      else{
        let newItem = Favourites(context: SaveLoad.shared.context)
        if let obj = referenceArray?[index.row]{
          newItem.id = obj.id
          newItem.imageUrl = obj.imageUrl
          newItem.title = obj.title
          newItem.images = obj.images
        }
      }
    }
  }

  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destination = segue.destination as! SelectedFavViewController
    if let index = tableView.indexPathForSelectedRow?.row{
      destination.object = imageDetail[index]
    }
  }

}
