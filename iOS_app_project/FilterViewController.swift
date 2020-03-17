//
//  FilterViewController.swift
//  iOS_app_project
//
//  Created by Maxim on 17.03.2020.
//  Copyright © 2020 Игорь Кузнецов. All rights reserved.
//

import UIKit

class FilterViewController: ViewController {
    
    
    
    @IBOutlet weak var switchOutlet: UISwitch!
    
    @IBOutlet weak var secondSwitchOutlet: UISwitch!
    
    @IBOutlet weak var sliderOutlet: UISlider!
    
    var filters: [Filter] = getFilters.all()
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        print(filters.count)
    }
    

}
