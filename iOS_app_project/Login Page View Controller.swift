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
    
    @IBAction func goToRegPageAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToRegPage", sender: self)
    }
    
    
}
