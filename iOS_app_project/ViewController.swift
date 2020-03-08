//
//  ViewController.swift
//  iOS_app_project
//
//  Created by Игорь Кузнецов on 08/12/2019.
//  Copyright © 2019 Игорь Кузнецов. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Фон копия.jpg")!)
        // Do any additional setup after loading th
        
        //Add data
       /*if let cont = context {
            let user = User(context: cont)
            user.login = "maria"
            user.password = "2020"
            try? cont.save()
        }*/
        
        //Delete data
        /*
        let req = NSFetchRequest<User>(entityName: "User")
        req.predicate = NSPredicate(format: "login == %@", "max")
                
        let delReq = NSBatchDeleteRequest(fetchRequest: req as! NSFetchRequest<NSFetchRequestResult>)
        try? context?.execute(delReq)
        try? context!.save()*/
    }

    @IBAction func enterButtonAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToLoginPage", sender: self)
    }
}
