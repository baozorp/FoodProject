//
//  MainDishViewModel.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 30.06.2023.
//

import Foundation
import SwiftUI

class MainDishViewModel: ObservableObject{
    
    @Published var dishes: [DishModel] = []
    
    private unowned let coordinator: MainDishCoordinator
    var category: String
    var cache: ImageCache
    
    func getDishes(){
        DispatchQueue.global(qos: .userInteractive).async{
            let dishGetter = DishGetter()
            dishGetter.getDishes(completion: {[weak self] dishes in
                DispatchQueue.main.async {
                    self?.dishes = dishes
                }
            })
        }
    }
    
    func cleanDishes(){
        self.dishes = []
    }
    
    init(coordinator: MainDishCoordinator, cache: ImageCache) {
        self.coordinator = coordinator
        self.category = coordinator.category
        self.cache = cache
    }
}
