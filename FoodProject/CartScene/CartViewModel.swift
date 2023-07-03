//
//  CartViewModel.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 03.07.2023.
//

import Foundation

class CartViewModel: ObservableObject{
    private unowned let coordinator: CartCoordinator
    var cache: ImageCache

    
    init(coordinator: CartCoordinator, cache: ImageCache) {
        self.coordinator = coordinator
        self.cache = cache
    }
}
