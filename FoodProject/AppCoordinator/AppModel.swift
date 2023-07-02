//
//  AppModel.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 30.06.2023.
//

import Foundation
import SwiftUI


class AppModel: Identifiable{
    var view: any View
    var scene: Scenes
    var image: Image
    var name: String
    
    init(view: any View, scene: Scenes) {
        self.view = view
        self.scene = scene
        switch scene{
        case .main:
            self.image = Image(systemName: "house.fill")
            self.name = "Главная"
        case .search:
            self.image = Image(systemName: "magnifyingglass")
            self.name = "Поиск"
        case .cart:
            self.image = Image(systemName: "basket")
            self.name = "Корзина"
        case .account:
            self.image = Image(systemName: "person.circle")
            self.name = "Аккаунт"
        }
    }
}
