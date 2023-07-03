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
    
    @Published var cartViewModel: CartViewModel!
    
    
    func start() -> any View {
        self.cartViewModel = CartViewModel(coordinator: self, cache: cache)
        return CartView(coordinator: self)
    }
    
    

    init(parent: Coordinator!, cache: ImageCache) {
        self.childs = []
        self.parent = parent
        self.scene = .cart
        self.cache = cache
    }
}
