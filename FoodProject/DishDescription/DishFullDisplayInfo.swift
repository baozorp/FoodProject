//
//  FullDataScreen.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 03.07.2023.
//

import Foundation


class DishFullDisplayInfo: ObservableObject{
    @Published var isNeedToShowFullDisplayInfo = false
    var dish: DishModel!{
        didSet{
            isNeedToShowFullDisplayInfo.toggle()
        }
    }
}
