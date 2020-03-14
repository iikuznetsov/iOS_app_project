//
//  EditingProfileViewController.swift
//  iOS_app_project
//
//  Created by Maxim on 15.03.2020.
//  Copyright © 2020 Игорь Кузнецов. All rights reserved.
//

import UIKit
import CoreData


class EditingProfileViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var surnameTextField: UITextField!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    var currentUser: signedInUser = signedInUser(login: "", password: "", email: "", phone: "", user_type: "Model")
    
    var context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.text = currentUser.login
        passwordTextField.text = currentUser.password
        emailTextField.text = currentUser.email
        phoneTextField.text = currentUser.phone
        
    }
    
    
    @IBAction func saveChangesButtonAction(_ sender: Any) {
        switch currentUser.user_type{
        case "Model":
        if let cont = context {
            let req = NSFetchRequest<Model>(entityName: "Model")
            req.predicate = NSPredicate(format: "login == %@", currentUser.login)
            let results = try? cont.fetch(req)
            results?.first?.password = passwordTextField.text
            results?.first?.email = emailTextField.text
            results?.first?.phone = phoneTextField.text
            results?.first?.name = nameTextField.text
            results?.first?.surname = surnameTextField.text
            
            let reqUser = NSFetchRequest<User>(entityName: "User")
            reqUser.predicate = NSPredicate(format: "login == %@", currentUser.login)
            let resultsUser = try? cont.fetch(reqUser)
            resultsUser?.first?.password = passwordTextField.text
            try? cont.save()
            }
        default: break
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
