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
  var checkData : [UserData]?
  //MARK: Save Function
  func save(){
    do{
        try context.save()
    }
    catch{
        fatalError("Error saving Data")
    }
  }
  
  //MARK: Functions
  func checkCredentials(with predicate: NSPredicate , password : String) -> Bool{
    let request: NSFetchRequest<UserData> = UserData.fetchRequest()
    request.predicate = predicate
    do{
      checkData = try context.fetch(request)
      if checkData?.count != 0 && checkData?[0].password == password{
         return true
      }
      else{
         return false
      }
    }
    catch{
      fatalError("Error while fetching!")
    }
    return false
 }
  
  func checkUsername(with predicate: NSPredicate) -> Bool{
    let request: NSFetchRequest<UserData> = UserData.fetchRequest()
    request.predicate = predicate
    do{
      checkData = try context.fetch(request)
      if checkData?.count != 0 {
        return false
      }
      else{
        return true
      }
    }
    catch{
      fatalError("Error while checking user")
    }
  }
  
  func checkEmail(with predicate: NSPredicate) -> Bool {
    let request: NSFetchRequest<UserData> = UserData.fetchRequest()
    request.predicate = predicate
    do{
      checkData = try context.fetch(request)
      if checkData?.count != 0 {
        return true
      }
      else{
        return false
      }
    }
    catch{
      fatalError("Error while checking user")
    }
  }
  
}
