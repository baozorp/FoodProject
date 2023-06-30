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
        case .cart:
            self.image = Image(systemName: "basket")
            self.name = "Корзина"
        default:
            self.image = Image(uiImage: UIImage())
            self.name = ""
        }
    }
}
