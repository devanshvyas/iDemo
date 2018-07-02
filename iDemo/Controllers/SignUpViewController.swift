//
//  SignUpViewController.swift
//  iDemo
//
//  Created by devansh.vyas on 22/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit
import SVProgressHUD

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
  
  override func viewWillAppear(_ animated: Bool) {
    hideKeyboard()
  }

  
  
  //MARK: Buttons Action
  @IBAction func signUpButton(_ sender: UIButton) {
    let predicate1 = NSPredicate(format: "username MATCHES %@", username.text ?? "")
    let predicate2 = NSPredicate(format: "%@ like '?*@?*.com'", email.text ?? "")
    let checkUser = data.checkUsername(with: predicate1)
    let checkMail = data.checkEmail(with: predicate2)
    if (name.text != ""),(email.text != ""),(mobileNo.text != ""),(username.text != ""),(password.text != ""){
      if checkingText(name, .decimalDigits),checkingText(name, .symbols),checkingText(name, .punctuationCharacters){
        if mobileNo.text?.count == 10 , checkingText(mobileNo, .letters) , checkingText(mobileNo, .symbols){
          if checkingText(password, .symbols){
            if checkMail == true, checkingText(email, .symbols){
              if checkUser == true , checkingText(username, .symbols){
                  newData.fullName = name.text
                  newData.email = email.text
                  newData.mobileNumber = Int64(mobileNo.text!)!
                  newData.username = username.text
                  newData.password = password.text
                  if let img = profileImage.image{
                    newData.profilePic = img
                  }
                  data.save()
                  SaveLoad.shared.defaults.set(true, forKey: "isLogin")
                  SaveLoad.shared.defaults.set(username.text!, forKey: "user")
                  performSegue(withIdentifier: "toHome", sender: self)
                  SVProgressHUD.showSuccess(withStatus: "Account Created")
              }
              else{
                SVProgressHUD.showError(withStatus: "Username Exists!")
              }
            }
            else{
             SVProgressHUD.showError(withStatus: "Invalid Email")
            }
          }
          else{
            SVProgressHUD.showError(withStatus: "Invalid Password")
          }
        }
        else{
          SVProgressHUD.showInfo(withStatus: "Invalid Mobile Number")
        }
      }
    else{
      SVProgressHUD.showInfo(withStatus: "Invalid FullName")
    }
  }
  else{
    SVProgressHUD.showInfo(withStatus: "Fill all fields")
  }
  }

  func checkingText(_ textField: UITextField,_ presentChar: CharacterSet) -> Bool {
    let checkRange = textField.text?.rangeOfCharacter(from: presentChar)
    if checkRange == nil{
      return true
    }
    else{
      return false
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

  @IBAction func signInPressed(_ sender: UIButton) {
    if let viewsCount = navigationController?.viewControllers.count{
      if viewsCount >= 3{
        navigationController?.popViewController(animated: true)
      }
      else{
        performSegue(withIdentifier: "toSignIn", sender: self)
      }
    }
    else{
      performSegue(withIdentifier: "toSignIn", sender: self)
    }
  }
  
}

//MARK: Image Picker
extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
      profileImage.image = pickedImage
      profileImage.layer.cornerRadius = profileImage.frame.width/2
      profileImage.clipsToBounds = true
      dismiss(animated: true, completion: nil)
    }
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
  }

}











