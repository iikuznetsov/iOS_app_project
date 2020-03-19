//
//  FilterViewController.swift
//  iOS_app_project
//
//  Created by Maxim on 17.03.2020.
//  Copyright © 2020 Игорь Кузнецов. All rights reserved.
//

import UIKit

protocol FilterViewControllerDelegate: AnyObject {
    func applyFilter(filters: [String])
}

class FilterViewController: ViewController {
    
    
    
    @IBOutlet weak var switchOutlet: UISwitch!
    
    @IBOutlet weak var secondSwitchOutlet: UISwitch!
    
    @IBOutlet weak var sliderOutlet: UISlider!
    
    @IBOutlet weak var manButton: UIButton!
    
    @IBOutlet weak var browsButton: UIButton!
    
    @IBOutlet weak var pedButton: UIButton!
    
    @IBOutlet weak var lashesButton: UIButton!
    
    @IBOutlet weak var classColourButton: UIButton!
    
    @IBOutlet weak var tatoButton: UIButton!
    
    @IBOutlet weak var creativeColourButton: UIButton!
    
    @IBOutlet weak var pierceButton: UIButton!
    
    @IBOutlet weak var spaButton: UIButton!
    
    @IBOutlet weak var cosmButton: UIButton!
    
    @IBOutlet weak var makeUpButton: UIButton!
    
    @IBOutlet weak var epilButton: UIButton!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        manButton.addTarget(self, action: #selector(buttonAction), for: UIControl.Event.touchUpInside)
        browsButton.addTarget(self, action: #selector(buttonAction), for: UIControl.Event.touchUpInside)
        pedButton.addTarget(self, action: #selector(buttonAction), for: UIControl.Event.touchUpInside)
        lashesButton.addTarget(self, action: #selector(buttonAction), for: UIControl.Event.touchUpInside)
        classColourButton.addTarget(self, action: #selector(buttonAction), for: UIControl.Event.touchUpInside)
        tatoButton.addTarget(self, action: #selector(buttonAction), for: UIControl.Event.touchUpInside)
        creativeColourButton.addTarget(self, action: #selector(buttonAction), for: UIControl.Event.touchUpInside)
        pierceButton.addTarget(self, action: #selector(buttonAction), for: UIControl.Event.touchUpInside)
        spaButton.addTarget(self, action: #selector(buttonAction), for: UIControl.Event.touchUpInside)
        cosmButton.addTarget(self, action: #selector(buttonAction), for: UIControl.Event.touchUpInside)
        makeUpButton.addTarget(self, action: #selector(buttonAction), for: UIControl.Event.touchUpInside)
        epilButton.addTarget(self, action: #selector(buttonAction), for: UIControl.Event.touchUpInside)
    }
    
    var isSelected: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false]
    
    let filters: [String] = ["Маникюр", "Архитектура бровей", "Педикюр", "Наращивание ресниц", "Классическое окрашивание", "Татуировки", "Креативное окрашивание", "Пирсинг", "Спа-процедуры", "Косметология", "Макияж", "Эпиляция"]
    
    @objc
    func buttonAction(sender: UIButton) {
        switch sender{
        case manButton:
           buttonSelect(Button: manButton, id: 0)
        case browsButton:
            buttonSelect(Button: browsButton, id: 1)
        case pedButton:
            buttonSelect(Button: pedButton, id: 2)
        case lashesButton:
            buttonSelect(Button: lashesButton, id: 3)
        case classColourButton:
            buttonSelect(Button: classColourButton, id: 4)
        case tatoButton:
            buttonSelect(Button: tatoButton, id: 5)
        case creativeColourButton:
            buttonSelect(Button: creativeColourButton, id: 6)
        case pierceButton:
            buttonSelect(Button: pierceButton, id: 7)
        case spaButton:
            buttonSelect(Button: spaButton, id: 8)
        case cosmButton:
            buttonSelect(Button: cosmButton, id: 9)
        case makeUpButton:
            buttonSelect(Button: makeUpButton, id: 10)
        case epilButton:
            buttonSelect(Button: epilButton, id: 11)
        default: break
        }
    }
    
    func buttonSelect(Button: UIButton, id: Int){
        if !isSelected[id]{
            isSelected[id] = true
            Button.layer.cornerRadius = 30
            Button.layer.borderWidth = 3.0
            Button.layer.borderColor = #colorLiteral(red: 0.4412127807, green: 0.7037000317, blue: 0.4492821145, alpha: 1)
            Button.clipsToBounds = true
            print(isSelected[id])
        } else{
            isSelected[id] = false
            Button.layer.borderColor = #colorLiteral(red: 0.8827067018, green: 0.9073504806, blue: 0.9886979461, alpha: 1)
            print(isSelected[id])
        }
    }
    var selectedFilters: [String] = []
    
    weak var delegate: FilterViewControllerDelegate?
    
    @IBAction func applyFilterAction(_ sender: Any) {
        selectedFilters = []
        for i in 0...11 {
            if isSelected[i]{
                selectedFilters.append(filters[i])
            }
        }
        print(selectedFilters)
        dismiss(animated: true) { [weak self] in
            //self?.delegate?.didEnterText(text: self?.currentText)
            self?.delegate?.applyFilter(filters: self!.selectedFilters)
        }
    }
}
