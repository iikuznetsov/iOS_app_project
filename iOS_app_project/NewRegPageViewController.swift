//
//  NewRegPageViewController.swift
//  iOS_app_project
//
//  Created by Maxim on 08.03.2020.
//  Copyright © 2020 Игорь Кузнецов. All rights reserved.
//

import UIKit

class NewRegPageViewController: UIViewController {
    @IBOutlet weak var UserView: UIView!
   
    @IBOutlet weak var MasterView: UIView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
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
