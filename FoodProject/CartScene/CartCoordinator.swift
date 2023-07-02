//
//  CartCoordinator.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 29.06.2023.
//

import Foundation
import SwiftUI

class CartCoordinator: Coordinator{
    
    var childs: [Coordinator]
    var parent: Coordinator!
    var scene: Scenes
    
    var cache: ImageCache
    
    func start() -> any View {
        Text("2")
    }
    

    init(parent: Coordinator!, cache: ImageCache) {
        self.childs = []
        self.parent = parent
        self.scene = .cart
        self.cache = cache
    }
}
