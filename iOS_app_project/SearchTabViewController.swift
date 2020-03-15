//
//  SearchTabViewController.swift
//  iOS_app_project
//
//  Created by Гость on 12.03.2020.
//  Copyright © 2020 Игорь Кузнецов. All rights reserved.
//

import UIKit

class SearchTabViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let posts = [String]() // настроить вытаскивание данных из бд через функцию класса постов
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchResultsTableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell
        //let post = posts[indexPath.row]
        //cell?.titleLabel.text = post
        //заполнить части ячейки с помощью данных бд, изображения использовать встроенные
        cell?.titleLabel.text = "Test"
        return cell!
    }
    
    
    @IBOutlet weak var searchResultsTableView: UITableView!
    
    @IBAction func filterButtonAction(_ sender: Any) {
        self.performSegue(withIdentifier: "openFilter", sender: self)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.7984377676, green: 0.846851587, blue: 0.9890239835, alpha: 1)

        searchResultsTableView.delegate = self
        searchResultsTableView.dataSource = self
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
