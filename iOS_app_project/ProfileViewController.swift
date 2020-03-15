//
//  ProfileViewController.swift
//  iOS_app_project
//
//  Created by Maxim on 14.03.2020.
//  Copyright © 2020 Игорь Кузнецов. All rights reserved.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var surnameLabel: UILabel!
    
    @IBOutlet weak var loginLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    let currentUserLogin: String = "masha"
    
    var currentUser: signedInUser = signedInUser(login: "", password: "", email: "", phone: "", user_type: "Модель")
    
    var context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.7984377676, green: 0.846851587, blue: 0.9890239835, alpha: 1)
        
        let request = User.fetchRequest() as NSFetchRequest<User>
        if let result = try? context?.fetch(request) {
            for user in result {
                if user.login == currentUserLogin {
                    switch user.user_type {
                        case "Модель":
                        let request = Model.fetchRequest() as NSFetchRequest<Model>
                        if let result = try? context?.fetch(request) {
                            for model in result {
                                if model.login == currentUserLogin{
                                    loginLabel.text = model.login
                                    passwordLabel.text = model.password
                                    emailLabel.text = model.email
                                    phoneLabel.text = model.phone
                                    let currUser = signedInUser(login: model.login!, password: model.password!, email: model.email!, phone: model.phone!, user_type: user.user_type!)
                                    currentUser = currUser
                                }
                            }
                        }
                    default : break
                    }
                }
            }
        }
    }
    
    @IBAction func editButtonAction(_ sender: Any) {
        self.performSegue(withIdentifier: "goToEditPage", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? EditingProfileViewController
        vc?.currentUser = currentUser
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
