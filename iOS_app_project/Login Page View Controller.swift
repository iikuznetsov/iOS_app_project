//
//  Login Page View Controller.swift
//  iOS_app_project
//
//  Created by Мария Караваева on 12.12.2019.
//  Copyright © 2019 Игорь Кузнецов. All rights reserved.
//

import Foundation

import UIKit

class LoginPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Pink.jpg")!)
        // Do any additional setup after loading th
    }
    @IBOutlet weak var emailOutlet: UITextField!
    
    @IBOutlet weak var passwordOutlet: UITextField!
    
    @IBAction func goToRegPageAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToRegPage", sender: self)
    }
    
    @IBAction func tryEnterAction(_ sender: UIButton) {
        
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
        if((emailOutlet.text! == data[3]) && (passwordOutlet.text! == data[1])){
            print("fuck you bitch")
        }
    
        
        
        
        
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
    
