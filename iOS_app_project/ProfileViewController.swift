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
    
    let currentUserLogin: String = "test69"
    
    var context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = User.fetchRequest() as NSFetchRequest<User>
        if let result = try? context?.fetch(request) {
            for user in result {
                if user.login == currentUserLogin {
                    switch user.user_type {
                        case "Model":
                        let request = Model.fetchRequest() as NSFetchRequest<Model>
                        if let result = try? context?.fetch(request) {
                            for model in result {
                                if model.login == currentUserLogin{
                                    loginLabel.text = model.login
                                    passwordLabel.text = model.password
                                    emailLabel.text = model.email
                                    print(model.email)
                                    phoneLabel.text = model.phone
                                }
                            }
                        }
                    default : break
                    }
                    loginLabel.text = user.login
                    passwordLabel.text = user.password
                    //emailLabel.text 
                }
            }
        }
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
