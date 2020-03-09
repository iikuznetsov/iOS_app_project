//
//  NewRegPageViewController.swift
//  iOS_app_project
//
//  Created by Maxim on 08.03.2020.
//  Copyright © 2020 Игорь Кузнецов. All rights reserved.
//

import UIKit
import CoreData

class NewRegPageViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    
    @IBOutlet weak var MasterView: UIView!
    
    @IBOutlet weak var UserView: UIView!
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var userLoginTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    @IBOutlet weak var userEmailTextField: UITextField!
    
    @IBOutlet weak var userPhoneTextField: UITextField!
    
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    
    
    @IBAction func isSelectionChanged(_ sender: Any) {
        print(segmentedControl.selectedSegmentIndex)
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            MasterView.isHidden = true
            UserView.isHidden = false
        case 1:
            MasterView.isHidden = false
            UserView.isHidden = true
        default:
            break;
        }
    }
    
    @IBAction func regButtonAction(_ sender: Any) {
        let wrongDataAlert = UIAlertController(title: "Wrong data", message: "This Login/email is already taken", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            print("OK!")
        }
        wrongDataAlert.addAction(okAction)
        var isDataOk = true
        if userLoginTextField.text != "" && userPasswordTextField.text != "" && userEmailTextField.text != "" && userPhoneTextField.text != "" {
            let request = User.fetchRequest() as NSFetchRequest<User>
            if let result = try? context?.fetch(request) {
                for user in result {
                    if userLoginTextField.text == user.login || userEmailTextField.text == user.email {
                        self.present(wrongDataAlert, animated: true)
                        isDataOk = false
                        break;
                    }
                }
            }
            if isDataOk{
                if let cont = context {
                    let newUser = User(context: cont)
                    newUser.login = userLoginTextField.text
                    newUser.password = userPasswordTextField.text
                    newUser.email = userEmailTextField.text
                    newUser.phone = userPhoneTextField.text
                    try? cont.save()
                }
                self.performSegue(withIdentifier: "toTabBar", sender: self)
            }
        } else {
                let notAllDataAlert = UIAlertController(title: "Missing data", message: "Fill all fields", preferredStyle: UIAlertController.Style.alert)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

