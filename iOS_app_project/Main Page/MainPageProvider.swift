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
            MainPage(name: "Креативное окрашивание", icon: #imageLiteral(resourceName: "creative dying")),
            MainPage(name: "Спа-процедуры", icon: #imageLiteral(resourceName: "spa")),
            MainPage(name: "Педикюр", icon: #imageLiteral(resourceName: "pedicure")),
            MainPage(name: "Косметология", icon: #imageLiteral(resourceName: "cosmetology")),
            MainPage(name: "Татуировки", icon: #imageLiteral(resourceName: "tattoo")),
            MainPage(name: "Классическое окрашивание", icon: #imageLiteral(resourceName: "classic dying")),
            MainPage(name: "Архитектура бровей", icon: #imageLiteral(resourceName: "brows")),
            MainPage(name: "Пирсинг", icon: #imageLiteral(resourceName: "piercing")),
            MainPage(name: "Наращивание ресниц", icon: #imageLiteral(resourceName: "lashes")),
            MainPage(name: "Эпиляция", icon: #imageLiteral(resourceName: "epilation")),
            MainPage(name: "Солярий", icon: #imageLiteral(resourceName: "sunroom"))
        ]
    }
}
