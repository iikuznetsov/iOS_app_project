//
//  Login Page View Controller.swift
//  iOS_app_project
//
//  Created by Мария Караваева on 12.12.2019.
//  Copyright © 2019 Игорь Кузнецов. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class LoginPageViewController: UIViewController, UITextFieldDelegate {
    var context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.view.backgroundColor = #colorLiteral(red: 0.7984377676, green: 0.846851587, blue: 0.9890239835, alpha: 1)
        
        self.emailOutlet.delegate = self
        self.passwordOutlet.delegate = self
        // Do any additional setup after loading th
    }
    @IBOutlet weak var emailOutlet: UITextField!
    
    @IBOutlet weak var passwordOutlet: UITextField!
    
    @IBAction func goToRegPageAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToReg", sender: self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func tryEnterAction(_ sender: UIButton) {
        print("ass")
        let request = User.fetchRequest() as NSFetchRequest<User>
        if let result = try? context?.fetch(request) {
            for user in result {
                print(user.login!)
                if(emailOutlet.text == user.login && passwordOutlet.text == user.password){
                    print(user.login)
                    print(user.password)
                    print(user.user_type)
                    print("nice")
                    self.performSegue(withIdentifier: "goToTabPage", sender: self)
                }
            }
        /*if let cont = context {
                   let user = User(context: cont)
            user.login = "a"
                   try? cont.save()
        }*/
        
        /*
        var readString = ""
        do {
            
            readString = try String(contentsOfFile: Bundle.main.path(forResource: "data", ofType: "txt")!)
        } catch let error as NSError {
            print("Failed reading from file, Error: " + error.localizedDescription)
        }
        print("File Text: \(readString)")
        var data = Array<Substring>()
        data = readString.split(separator: ",")
       
        print(data[3])
        print(emailOutlet.text!)
        print(emailOutlet.text! == data[3])
        
        print(data.count)
        
        if((emailOutlet.text! == data[3]) && (passwordOutlet.text! == data[1])){
            print("fuck you bitch")

        }*/
    
        
        
        
        
        /*var json: Array!
        do {
          json = try NSJSONSerialization.JSONObjectWithData(JSONData, options: NSJSONReadingOptions()) as? Array
        } catch {
          print(error)
        }
         
        if let item = json[0] as? [String: AnyObject] {
          if let person = item["person"] as? [String: AnyObject] {
            if let age = person["age"] as? Int {
              print("Dani's age is \(age)")
            }
          }
        }*/
            
    }
}
}


