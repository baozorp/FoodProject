//
//  DishDescriptionViewModel.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 03.07.2023.
//

import Foundation

class DishDescriptionViewModel: ObservableObject{
    
    var cache: ImageCache
    private unowned var coordinator: AppCoordinator
    var dish: DishModel
    
    
    init(dish: DishModel, coordinator: AppCoordinator, cache: ImageCache) {
        self.dish = dish
        self.coordinator = coordinator
        self.cache = cache
    }
}
