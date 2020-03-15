//
//  SearchTabViewController.swift
//  iOS_app_project
//
//  Created by Гость on 12.03.2020.
//  Copyright © 2020 Игорь Кузнецов. All rights reserved.
//

import UIKit

class SearchTabViewController: UIViewController {
    
    @IBOutlet weak var searchResultsTableView: UITableView!
    
    @IBAction func filterButtonAction(_ sender: Any) {
        self.performSegue(withIdentifier: "openFilter", sender: self)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.7984377676, green: 0.846851587, blue: 0.9890239835, alpha: 1)

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
