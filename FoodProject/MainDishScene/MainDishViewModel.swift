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
    
    func getDishes(){
        DispatchQueue.global(qos: .userInteractive).async{
            DishGetter.getCategories(completion: {[weak self] dishes in
                DispatchQueue.main.async {
                    self?.dishes = dishes
                }
            })
        }
    }
    
    func cleanDishes(){
        self.dishes = []
    }
    
    init(coordinator: MainDishCoordinator) {
        self.coordinator = coordinator
        self.category = coordinator.category

    }
}
