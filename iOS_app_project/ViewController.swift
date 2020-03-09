//
//  ViewController.swift
//  iOS_app_project
//
//  Created by Игорь Кузнецов on 08/12/2019.
//  Copyright © 2019 Игорь Кузнецов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Фон копия.jpg")!)
        // Do any additional setup after loading th
    }

    @IBAction func enterButtonAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToLoginPage", sender: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
