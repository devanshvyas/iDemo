//
//  jsonData.swift
//  iDemo
//
//  Created by devansh.vyas on 25/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class JsonData {
  
  //MARK: variables
  static let shared = JsonData()
  var imageURL = [URL]()
  var imageTitle = [String]()
  var imageId = [Decimal]()
  var param = ["key":"9256559-4577776c3a6d49717de08f786"]
  var apiURL = "https://pixabay.com/api/"
  
  func networking(que: String = "nature", page: Int = 1,finished : @escaping ()-> Void){
    imageURL.removeAll()
    param["q"] = que
    param["page"] = String(page)
    Alamofire.request("https://pixabay.com/api/", method: .get, parameters: param).responseJSON {
      response in
      if response.result.isSuccess{
        let json = JSON(response.result.value!)
        let hits = json["hits"]
        for (index,_) in hits.enumerated(){
          if let url = hits[index]["webformatURL"].url,let id = hits[index]["id"].int, let tags = hits[index]["tags"].string{
            self.imageURL.append(url)
            self.imageTitle.append(tags)
            self.imageId.append(Decimal(id))
          }
          if index == hits.count-1{
            finished()
          }
      }
    }
  }
  

 }
}
