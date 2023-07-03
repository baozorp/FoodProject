//
//  MainDishViewModel.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 30.06.2023.
//

import Foundation
import SwiftUI

class MainDishListViewModel: ObservableObject{
    
    @Published var dishes: [DishModel] = []
    
    private unowned let coordinator: MainCategoryCoordinator
    var category: String
    var cache: ImageCache
    
    func getDishes(){
        
        let dishGetter = DishGetter()
        dishGetter.getDishes(completion: {[weak self] dishes in
            self?.dishes = dishes
        })
    }
    
    func cleanDishes(){
        self.dishes = []
    }
    
    init(coordinator: MainCategoryCoordinator, category: String, cache: ImageCache) {
        self.coordinator = coordinator
        self.category = category
        self.cache = cache
    }
}
