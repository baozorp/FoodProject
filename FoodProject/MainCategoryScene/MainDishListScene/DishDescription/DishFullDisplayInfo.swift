//
//  FullDataScreen.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 03.07.2023.
//

import Foundation


class DishFullDisplayInfo: ObservableObject{
    @Published var isNeedToShowFullDisplayInfo = false
    @Published var dish: DishModel!{
        didSet{
            isNeedToShowFullDisplayInfo = true
        }
    }
    
    func setDish(dish: DishModel){
        self.dish = dish
    }
    

    
    func hide(){
        self.isNeedToShowFullDisplayInfo = false
    }
}
