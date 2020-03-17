//
//  InfoPageViewController.swift
//  iOS_app_project
//
//  Created by Maxim on 16.03.2020.
//  Copyright © 2020 Игорь Кузнецов. All rights reserved.
//

import UIKit

class InfoPageViewController: ViewController {
    
    var post: appPost = appPost(title: "", category: "",content: "", imagePath: "")
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var postImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = post.title
        descriptionTextView.text = post.content
        postImageView.image = UIImage(named: post.imagePath)
        descriptionTextView.backgroundColor = #colorLiteral(red: 0.8827067018, green: 0.9073504806, blue: 0.9886979461, alpha: 1)
    }
    
    
    @IBAction func applyButtonAction(_ sender: Any) {
        self.performSegue(withIdentifier: "goToFormPage", sender: self)
        //self.dismiss(animated: true) продумать логику убирания экрана с инфой
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
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
