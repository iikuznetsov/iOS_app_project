//
//  SearchTabViewController.swift
//  iOS_app_project
//
//  Created by Гость on 12.03.2020.
//  Copyright © 2020 Игорь Кузнецов. All rights reserved.
//

import UIKit

class SearchTabViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    //let posts = GetAppPost.all() // настроить вытаскивание данных из бд через функцию класса постов
    var filteredPosts: [appPost] = []
    
    var index: Int = 0
    
    var filtersForPosts: [String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchResultsTableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell
        cell?.backgroundColor = #colorLiteral(red: 0.8827067018, green: 0.9073504806, blue: 0.9886979461, alpha: 1)
        cell?.contentTextView.backgroundColor = #colorLiteral(red: 0.8827067018, green: 0.9073504806, blue: 0.9886979461, alpha: 1)
        let post = filteredPosts[indexPath.row]
        cell?.titleLabel.text = post.title
        cell?.contentTextView.text = post.content
        cell?.contentTextView.isEditable = false
        cell?.postImageView.image = UIImage(named: post.imagePath)
        //заполнить части ячейки с помощью данных бд, изображения использовать встроенные
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        index = indexPath.row
        
        performSegue(withIdentifier: "goToAdInfo", sender: filteredPosts[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? InfoPageViewController
        vc?.post = filteredPosts[index]
    }
    
    @IBOutlet weak var searchResultsTableView: UITableView!
    
    
    @IBAction private func filterButtonTapped(_ sender: UIButton) {
        
        guard let filterViewController = makeFilterViewController() else { return }
        
        filterViewController.delegate = self
        
        present(filterViewController, animated: true, completion: nil)
    }
    
    private func makeFilterViewController() -> FilterViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard
            let filterViewController = storyboard.instantiateViewController(identifier: "FilterViewController") as? FilterViewController
            else { return nil }
        return filterViewController
    }
    
    
    @IBOutlet weak var filterButtonOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredPosts = GetAppPost.all()
        self.view.backgroundColor = #colorLiteral(red: 0.8827067018, green: 0.9073504806, blue: 0.9886979461, alpha: 1)
        searchResultsTableView.backgroundColor = #colorLiteral(red: 0.8827067018, green: 0.9073504806, blue: 0.9886979461, alpha: 1)

        searchResultsTableView.delegate = self
        searchResultsTableView.dataSource = self
        print(filteredPosts.count)
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        let search: String = searchText
        if search == "" {
            filteredPosts = GetAppPost.all()
        } else {
            let posts = GetAppPost.all()
            filteredPosts = []
            for post in posts{
                if post.title.contains(search){
                    filteredPosts.append(post)
                }
            }
        }
        searchResultsTableView.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        let search: String = searchBar.text!
        if search == "" {
            filteredPosts = GetAppPost.all()
        } else {
            let posts = GetAppPost.all()
            filteredPosts = []
            for post in posts{
                if post.title.contains(search){
                    filteredPosts.append(post)
                }
            }
        }
        searchResultsTableView.reloadData()
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.resignFirstResponder()
        return true
    }
}

extension SearchTabViewController: FilterViewControllerDelegate {
    
    func applyFilter(filters: [String]) {
        if filters == [] {
            filteredPosts = GetAppPost.all()
        } else {
            let posts = GetAppPost.all()
            filteredPosts = []
            for post in posts{
                for filter in filters {
                    if post.category == filter{
                        filteredPosts.append(post)
                    }
                }
            }
        }
        searchResultsTableView.reloadData()
    }
    
    
    
}
