//
//  NewRegPageViewController.swift
//  iOS_app_project
//
//  Created by Maxim on 08.03.2020.
//  Copyright © 2020 Игорь Кузнецов. All rights reserved.
//

import UIKit
import CoreData

class NewRegPageViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {
    var context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    
    @IBOutlet weak var MasterView: UIView!
    
    @IBOutlet weak var UserView: UIView!
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var userLoginTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    @IBOutlet weak var userEmailTextField: UITextField!
    
    
    @IBOutlet weak var userPhoneTextField: UITextField!
    
    @IBOutlet weak var masterCodeTextField: UITextField!
    
    @IBOutlet weak var masterOccupationTextField: UITextField!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    
    
    @IBAction func isSelectionChanged(_ sender: Any) {
        print(segmentedControl.selectedSegmentIndex)
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            logoImageView.image = UIImage(named: "logotext.png")
            MasterView.isHidden = true
            masterCodeTextField.text = ""
            masterOccupationTextField.text = ""
        case 1:
            logoImageView.image = UIImage(named: "logotext2.png")
            MasterView.isHidden = false
        default:
            break;
        }
    }
    
    @IBAction func regButtonAction(_ sender: Any) {
        let wrongDataAlert = UIAlertController(title: "Неверные данные", message: "Такой логин и/или адрес электронной почты уже существует", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            print("OK!")
        }
        wrongDataAlert.addAction(okAction)
        var isDataOk = true
        if userLoginTextField.text != "" && userPasswordTextField.text != "" && userEmailTextField.text != "" && userPhoneTextField.text != "" {
            if segmentedControl.selectedSegmentIndex == 1{
                if masterOccupationTextField.text == "" && masterCodeTextField.text == "" {
                    isDataOk = false
                }
            }
            let request = User.fetchRequest() as NSFetchRequest<User>
            if let result = try? context?.fetch(request) {
                for user in result {
                    if user.login == userLoginTextField.text {
                        self.present(wrongDataAlert, animated: true)
                        isDataOk = false
                        break;
                    }
                }
            }
            if isDataOk{
                var userType = ""
                switch(segmentedControl.selectedSegmentIndex){
                case 0:
                    userType = "Модель"
                    if let cont = context {
                        let newModel = Model(context: cont)
                        newModel.login = userLoginTextField.text
                        newModel.password = userPasswordTextField.text
                        newModel.email = userEmailTextField.text
                        newModel.phone = userPhoneTextField.text
                        try? cont.save()
                    }
                    //self.performSegue(withIdentifier: "toTabBar", sender: self)
                case 1:
                    userType = "Мастер"
                    if let cont = context {
                        let newMaster = Master(context: cont)
                        newMaster.login = userLoginTextField.text
                        newMaster.password = userPasswordTextField.text
                        newMaster.email = userEmailTextField.text
                        newMaster.phone = userPhoneTextField.text
                        newMaster.masterOccupation = masterOccupationTextField.text
                        newMaster.masterCode = masterCodeTextField.text
                        try? cont.save()
                    }
                    //self.performSegue(withIdentifier: "toTabBar", sender: self)
                default: break
                }
                if let cont = context{
                    let newUser = User(context: cont)
                    newUser.login = userLoginTextField.text
                    newUser.password = userPasswordTextField.text
                    newUser.user_type = userType
                    try? cont.save()
                    self.performSegue(withIdentifier: "toTabBar", sender: self)
                }
                
            }
        } else {
                let notAllDataAlert = UIAlertController(title: "Данных недостаточно", message: "Заполните все поля", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
                    print("OK!")
                }
                notAllDataAlert.addAction(okAction)
                self.present(notAllDataAlert, animated: true)
            }
        }
    
    @IBAction func imageButtonAction(_ sender: Any) {
        masterReg()
    }
    
    var isSecure: Bool = false
    
    
    @IBOutlet weak var showPasswordButton: UIButton!
    
    @IBAction func showPasswordAction(_ sender: Any) {
        if isSecure{
            userPasswordTextField.isSecureTextEntry = false
            showPasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
            isSecure = false
        } else{
            userPasswordTextField.isSecureTextEntry = true
            showPasswordButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            isSecure = true
        }
    }
    
    func masterReg(){
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    /*
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)

        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        
        // print out the image size as a test
        print(image.size)
        photoImageView.image = image
    }*/
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
        self.view.backgroundColor = #colorLiteral(red: 0.8827067018, green: 0.9073504806, blue: 0.9886979461, alpha: 1)
        self.UserView.backgroundColor = #colorLiteral(red: 0.8827067018, green: 0.9073504806, blue: 0.9886979461, alpha: 1)
        self.MasterView.backgroundColor = #colorLiteral(red: 0.8827067018, green: 0.9073504806, blue: 0.9886979461, alpha: 1)
        
        
        self.userLoginTextField.delegate = self
        self.userPasswordTextField.delegate = self
        self.userEmailTextField.delegate = self
        self.userPhoneTextField.delegate = self
        
        logoImageView.image = UIImage(named: "logotext.png")
        userPasswordTextField.isSecureTextEntry = true
        
        addTapGestureToHideKeyboard()
    }
    
    func addTapGestureToHideKeyboard() {
            let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
            view.addGestureRecognizer(tapGesture)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBOutlet weak var loginCheckBoxImageView: UIImageView!
    
    @IBOutlet weak var passwordCheckBoxImageView: UIImageView!
    
    @IBOutlet weak var emailCheckBoxImageView: UIImageView!
    
    @IBOutlet weak var phoneCheckBoxImageView: UIImageView!
    
    @IBOutlet weak var occupationCheckBoxImageView: UIImageView!
    
    @IBOutlet weak var masterCodeCheckBoxImageView: UIImageView!
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField{
        case userLoginTextField:
            let request = User.fetchRequest() as NSFetchRequest<User>
            var isLoginOk: Bool = true
            if let result = try? context?.fetch(request) {
                for user in result {
                    if user.login == userLoginTextField.text {
                        isLoginOk = false
                        loginCheckBoxImageView.image = UIImage(systemName: "xmark")
                        loginCheckBoxImageView.tintColor = #colorLiteral(red: 0.7546754728, green: 0.2473161223, blue: 0.2139258107, alpha: 1)
                        break;
                    }
                }
            }
            if isLoginOk{
                loginCheckBoxImageView.image = UIImage(systemName: "checkmark")
                loginCheckBoxImageView.tintColor = #colorLiteral(red: 0.4412127807, green: 0.7037000317, blue: 0.4492821145, alpha: 1)
            }
            if userLoginTextField.text == "" {
                loginCheckBoxImageView.image = nil
            }
            //loginCheckBoxImageView.tintColor = #colorLiteral(red: 0.7546754728, green: 0.2473161223, blue: 0.2139258107, alpha: 1)
        case userPasswordTextField:
            if userPasswordTextField.text!.count > 5 {
                passwordCheckBoxImageView.image = UIImage(systemName: "checkmark")
                passwordCheckBoxImageView.tintColor = #colorLiteral(red: 0.4412127807, green: 0.7037000317, blue: 0.4492821145, alpha: 1)
            } else {
                passwordCheckBoxImageView.image = UIImage(systemName: "xmark")
                passwordCheckBoxImageView.tintColor = #colorLiteral(red: 0.7546754728, green: 0.2473161223, blue: 0.2139258107, alpha: 1)
            }
            if userPasswordTextField.text == "" {
                passwordCheckBoxImageView.image = nil
            }
        case userEmailTextField:
            if (userEmailTextField.text?.contains("@"))!{
                emailCheckBoxImageView.image = UIImage(systemName: "checkmark")
                emailCheckBoxImageView.tintColor = #colorLiteral(red: 0.4412127807, green: 0.7037000317, blue: 0.4492821145, alpha: 1)
            } else {
                emailCheckBoxImageView.image = UIImage(systemName: "xmark")
                emailCheckBoxImageView.tintColor = #colorLiteral(red: 0.7546754728, green: 0.2473161223, blue: 0.2139258107, alpha: 1)
            }
            if userEmailTextField.text == "" {
                emailCheckBoxImageView.image = nil
            }
        case userPhoneTextField:
            if userPhoneTextField.text == "" {
                phoneCheckBoxImageView.image = nil
            } else {
                phoneCheckBoxImageView.image = UIImage(systemName: "checkmark")
                phoneCheckBoxImageView.tintColor = #colorLiteral(red: 0.4412127807, green: 0.7037000317, blue: 0.4492821145, alpha: 1)
            }
        case masterOccupationTextField:
            if masterOccupationTextField.text == "" {
                occupationCheckBoxImageView.image = nil
            } else {
                occupationCheckBoxImageView.image = UIImage(systemName: "checkmark")
                occupationCheckBoxImageView.tintColor = #colorLiteral(red: 0.4412127807, green: 0.7037000317, blue: 0.4492821145, alpha: 1)
            }
        case masterCodeTextField:
            if masterCodeTextField.text == "" {
                masterCodeCheckBoxImageView.image = nil
            } else {
                masterCodeCheckBoxImageView.image = UIImage(systemName: "checkmark")
                masterCodeCheckBoxImageView.tintColor = #colorLiteral(red: 0.4412127807, green: 0.7037000317, blue: 0.4492821145, alpha: 1)
            }
            //последние два не работают, хз почему, надо поправить
        default: break
        }
    }

}

