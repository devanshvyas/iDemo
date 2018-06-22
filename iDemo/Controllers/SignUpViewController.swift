//
//  SignUpViewController.swift
//  iDemo
//
//  Created by devansh.vyas on 22/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

  //MARK: Variables
  var data = SaveLoad.shared
  var imagePicker = UIImagePickerController()
  let newData = UserData(context: SaveLoad.shared.context)
  
  //MARK: Outlets
  @IBOutlet weak var name: UITextField!
  @IBOutlet weak var email: UITextField!
  @IBOutlet weak var mobileNo: UITextField!
  @IBOutlet weak var username: UITextField!
  @IBOutlet weak var password: UITextField!
  @IBOutlet weak var profileImage: UIImageView!
  
  override func viewDidLoad() {
        super.viewDidLoad()
 }

  //MARK: Buttons Action
  @IBAction func signUpButton(_ sender: UIButton) {
    if (name.text != nil),(email.text != nil),(mobileNo.text?.count == 10),(username.text != nil),(password.text != nil){
      newData.fullName = name.text
      newData.email = email.text
      newData.mobileNumber = Int64(mobileNo.text!)!
      newData.username = username.text
      newData.password = password.text
      if let img = profileImage.image{
        newData.profilePic = img
      }
      data.save()
    }
  }
  
  @IBAction func addImage(_ sender: UIButton) {
    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
      imagePicker.delegate = self
      imagePicker.allowsEditing = false
      imagePicker.sourceType = .photoLibrary
      present(imagePicker,animated: true,completion: nil)
    }
  }

  
}














