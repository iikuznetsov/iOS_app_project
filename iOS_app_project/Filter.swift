//
//  Filter.swift
//  iOS_app_project
//
//  Created by Maxim on 17.03.2020.
//  Copyright © 2020 Игорь Кузнецов. All rights reserved.
//

import UIKit
import Foundation

struct Filter: Decodable {
    let name: String
    let imagePath: String
}

struct getFilters {
    static func all() -> [Filter] {
        guard
            let url = Bundle.main.url(forResource: "filters", withExtension: "json"),
            let data = try? Data(contentsOf: url)
        else {
            return []
        }
        
        let filters = try? JSONDecoder().decode([Filter].self, from: data)
        
        return filters ?? []
    }
    
}
