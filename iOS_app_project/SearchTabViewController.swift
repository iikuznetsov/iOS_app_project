//
//  SearchTabViewController.swift
//  iOS_app_project
//
//  Created by Гость on 12.03.2020.
//  Copyright © 2020 Игорь Кузнецов. All rights reserved.
//

import UIKit

class SearchTabViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let posts = GetAppPost.all() // настроить вытаскивание данных из бд через функцию класса постов
    
    var index: Int = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchResultsTableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell
        let post = posts[indexPath.row]
        cell?.titleLabel.text = post.title
        cell?.contentTextView.text = post.content
        cell?.contentTextView.isEditable = false
        cell?.postImageView.image = UIImage(named: post.imagePath)
        //заполнить части ячейки с помощью данных бд, изображения использовать встроенные
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        index = indexPath.row
        
        performSegue(withIdentifier: "goToAdInfo", sender: posts[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? InfoPageViewController
        vc?.post = posts[index]
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
        print(posts.count)
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
