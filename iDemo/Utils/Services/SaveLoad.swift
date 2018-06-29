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
  var checkData: [UserData]?
	var checkImg: [Favourites]?
	let defaults = UserDefaults.standard
//	var checkItem 
	
  //MARK: Save Function
  func save(){
    do{
        try context.save()
    }
    catch{
        print(error)
    }
  }
	//MARK: Load Data
	func loadFavData() -> [Favourites]{
		let req: NSFetchRequest<Favourites> = Favourites.fetchRequest()
		var favArray: [Favourites]?
		do{
			favArray = try context.fetch(req)
		}
		catch{
			fatalError("Error while loading")
		}
		return favArray!
	}
	
  //MARK: for sign up and sign in
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
	
	func getUserData(with predicate: NSPredicate) -> UserData {
		let request: NSFetchRequest<UserData> = UserData.fetchRequest()
		request.predicate = predicate
		let data: [UserData]?
		do{
			data = try context.fetch(request)
		}
		catch{
			fatalError("Error while getting data")
		}
		return data![0]
	}
	
	//MARK: functions for favourite image
	func checkImage(user: String, id: Decimal) -> Bool {
		
		let request: NSFetchRequest<Favourites> = Favourites.fetchRequest()
		let pre1 = NSPredicate(format: "images.username == %@", user)
		let pre2 = NSPredicate(format: "id == %@", NSDecimalNumber(decimal: id))
		let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [pre1,pre2])
		request.predicate = predicate
		do{
			checkImg = try context.fetch(request)
			if checkImg?.count != 0 {
				return true
			}
			else{
				return false
			}
		}
		catch{
			fatalError("Error while checking image")
		}
	}
	
	func delete(with predicate: NSPredicate){
		let req: NSFetchRequest<Favourites> = Favourites.fetchRequest()
		req.predicate = predicate
		do{
			checkImg = try context.fetch(req)
			context.delete(checkImg![0])
			try context.save()
		}
		catch{
			fatalError("Error while deleting")
		}
	}
	
	func loadFavUserImage(user: String) -> [Favourites]{
		let request: NSFetchRequest<Favourites> = Favourites.fetchRequest()
		let pre = NSPredicate(format: "images.username == %@", user)
		request.predicate = pre
		let data: [Favourites]?
		do{
			data = try context.fetch(request)
		}
		catch{
			fatalError("Error while getting data")
		}
		return data!
	}
	
}
