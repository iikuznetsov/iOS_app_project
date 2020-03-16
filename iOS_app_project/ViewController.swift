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
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        self.view.backgroundColor = #colorLiteral(red: 0.8827067018, green: 0.9073504806, blue: 0.9886979461, alpha: 1)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Фон копия.jpg")!)
        // Do any additional setup after loading th
        
        //Add data
       /*if let cont = context {
            let user = User(context: cont)
            user.login = "maria"
            user.password = "2020"
            try? cont.save()
        }*/
        
        if let cont = context {
             let post = Post(context: cont)
            post.title = "Окрашивание"
            post.content = "Приглашаем на профессиональное окрашивание (по цене материалов), ищем моделей готовых к экспериментам и творческому подходу к процессу"
            post.date = Date(timeIntervalSinceNow: 100)
             try? cont.save()
         }
        
        //Delete data
        /*
        let req = NSFetchRequest<User>(entityName: "User")
        req.predicate = NSPredicate(format: "login == %@", "max")
                
        let delReq = NSBatchDeleteRequest(fetchRequest: req as! NSFetchRequest<NSFetchRequestResult>)
        try? context?.execute(delReq)
        try? context!.save()*/
    }
    @IBAction func newAccountAction(_ sender: Any) {
        self.performSegue(withIdentifier: "goToRegPage", sender: self)
    }
    
    @IBAction func enterButtonAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToLoginPage", sender: self)
    }
}
