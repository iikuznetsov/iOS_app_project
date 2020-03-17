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
    
    @IBOutlet weak var manButtonOutlet: UIButton!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        manButtonOutlet.layer.cornerRadius = 30
        manButtonOutlet.layer.borderWidth = 3.0
        manButtonOutlet.layer.borderColor = #colorLiteral(red: 0.4412127807, green: 0.7037000317, blue: 0.4492821145, alpha: 1)
        manButtonOutlet.clipsToBounds = true
        print(filters.count)
    }
    

}
