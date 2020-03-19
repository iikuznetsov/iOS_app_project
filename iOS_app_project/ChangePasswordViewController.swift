//
//  ChangePasswordViewController.swift
//  iOS_app_project
//
//  Created by Maxim on 19.03.2020.
//  Copyright © 2020 Игорь Кузнецов. All rights reserved.
//

import UIKit
import CoreData

class ChangePasswordViewController: ViewController, UITextFieldDelegate {

    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var loginExistLabel: UILabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var confirmPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginExistLabel.isHidden = true
        
        addTapGestureToHideKeyboard()
        
    }
        
        func addTapGestureToHideKeyboard() {
                let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
                view.addGestureRecognizer(tapGesture)
        }
    @IBAction func changeAction(_ sender: Any) {
        let request = User.fetchRequest() as NSFetchRequest<User>
        if let result = try? context?.fetch(request) {
            for user in result {
                if loginTextField.text == user.login{
                    user.password = confirmPassword.text
                    try? context?.save()
                }
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField{
        case loginTextField:
            let request = User.fetchRequest() as NSFetchRequest<User>
            if let result = try? context?.fetch(request) {
                for user in result {
                    if loginTextField.text == user.login{
                        break
                    }
                }
                loginExistLabel.isHidden = false
            }
        case confirmPassword:
            if(confirmPassword.text != passwordTextField.text){
                print("Passwords do not match")
            }
        default: break
    }

    }
}
