//
//  SaveLoad.swift
//  iDemo
//
//  Created by devansh.vyas on 22/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit
import CoreData

class SaveLoad{
  
  //MARK: variables
  var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  static let shared = SaveLoad()
  
  //MARK: Save Function
  func save(){
    do{
        try context.save()
    }
    catch{
        fatalError("Error saving Data")
    }
  }
  
  //MARK: Load Functions
  func loadUserData(){
    
  }
  
  func loadImages() {
    
  }
  
}
