//
//  cartArray.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 03.07.2023.
//

import Foundation

class CartArray: ObservableObject{
    
    @Published var cartArray: [DishModel] = []
    
    func addDishToCart(dish: DishModel){
        self.cartArray.append(dish)
    }
    func removeDishFromCart(dish: DishModel){
        if let index = self.cartArray.firstIndex(of: dish){
            self.cartArray.remove(at: index)
        }
    }
}
