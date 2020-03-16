//
//  Post.swift
//  iOS_app_project
//
//  Created by Maxim on 16.03.2020.
//  Copyright © 2020 Игорь Кузнецов. All rights reserved.
//

import UIKit
import Foundation

struct appPost: Decodable {
    let title: String
    let content: String
    let imagePath: String
    
}

struct GetAppPost {
    
    static func all() -> [appPost] {
        guard
            let url = Bundle.main.url(forResource: "posts", withExtension: "json"),
            let data = try? Data(contentsOf: url)
        else {
            return []
        }
        
        let posts = try? JSONDecoder().decode([appPost].self, from: data)
        
        return posts ?? []
    }
    
}
