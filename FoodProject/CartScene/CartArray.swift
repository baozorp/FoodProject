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
        if let dishIndex = self.cartArray.firstIndex(where: { dishFounded in
            dishFounded.id == dish.id
        }){
            self.cartArray[dishIndex].countInCart += 1
        }
        else{
            var dish = dish
            dish.countInCart = 1
            self.cartArray.append(dish)
        }

    }
    func removeDishFromCart(dish: DishModel){
        if let dishIndex = self.cartArray.firstIndex(where: { dishFounded in
            dishFounded.id == dish.id
        }){
            if self.cartArray[dishIndex].countInCart == 1{
                self.cartArray.remove(at: dishIndex)
            }
            else{
                self.cartArray[dishIndex].countInCart -= 1
            }
        }
    }
    
    func getCartCost()->Int{
        var cost: Int = 0
        for i in self.cartArray{
            cost += i.price * i.countInCart
        }
        return cost
    }
}

struct cartDishModel{
    private var dish: DishModel

}
