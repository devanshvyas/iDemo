//
//  AppDelegate.swift
//  iDemo
//
//  Created by devansh.vyas on 21/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
    if statusBar.responds(to: #selector(setter: UIView.backgroundColor)){
      statusBar.backgroundColor = UIColor(red: 0/255, green: 84/255, blue: 147/255, alpha: 1)
    }
    UIApplication.shared.statusBarStyle = .lightContent
    if SaveLoad.shared.defaults.bool(forKey: "isLogin") == true{
      self.window = UIWindow(frame: UIScreen.main.bounds)
      
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      
      let initialViewController = storyboard.instantiateViewController(withIdentifier: "toHomeVC")
      
      self.window?.rootViewController = initialViewController
      self.window?.makeKeyAndVisible()

    }
     return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
  }

  func applicationWillTerminate(_ application: UIApplication) {
    
   self.saveContext()
  }

  // MARK: - Core Data stack

  lazy var persistentContainer: NSPersistentContainer = {
      let container = NSPersistentContainer(name: "iDemo")
      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
          if let error = error as NSError? {
             fatalError("Unresolved error \(error), \(error.userInfo)")
          }
      })
      return container
  }()

  // MARK: - Core Data Saving support

  func saveContext () {
      let context = persistentContainer.viewContext
      if context.hasChanges {
          do {
              try context.save()
          } catch {
             let nserror = error as NSError
              fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
          }
      }
  }

}

