//
//  FruitsProvider.swift
//  CustomCollectionLayout
//
//  Created by Maksym Husar on 2/17/19.
//  Copyright © 2019 MaksymHusar. All rights reserved.
//

import Foundation

struct MainPageProvider {
    static func get() -> [MainPage] {
        return [
            MainPage(name: "Маникюр", icon: #imageLiteral(resourceName: "manicure")),
            MainPage(name: "Окрашивание", icon: #imageLiteral(resourceName: "creative dying")),
            MainPage(name: "Спа-процедуры", icon: #imageLiteral(resourceName: "spa")),
            MainPage(name: "Педикюр", icon: #imageLiteral(resourceName: "pedicure")),
            MainPage(name: "Косметология", icon: #imageLiteral(resourceName: "cosmetology")),
            MainPage(name: "Татуировки", icon: #imageLiteral(resourceName: "tattoo")),
            MainPage(name: "Окрашивание2", icon: #imageLiteral(resourceName: "classic dying")),
            MainPage(name: "Татуаж бровей", icon: #imageLiteral(resourceName: "brows")),
            MainPage(name: "Пирсинг", icon: #imageLiteral(resourceName: "piercing")),
            MainPage(name: "Реснички", icon: #imageLiteral(resourceName: "lashes")),
            MainPage(name: "Электроэпиляция", icon: #imageLiteral(resourceName: "epilation")),
            MainPage(name: "Солярий", icon: #imageLiteral(resourceName: "sunroom"))
        ]
    }
}
