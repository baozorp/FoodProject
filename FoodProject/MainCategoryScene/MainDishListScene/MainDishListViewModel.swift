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
    @Published var tegs: [Teg] = []
    
    private unowned let coordinator: MainCategoryCoordinator
    var category: String
    var cache: ImageCache
    
    
    struct Teg: Identifiable, Equatable{
        let id = UUID()
        let name: String
        var isSelected: Bool = false
    }
    
    func selectedTeg(teg: Teg){
        if let index = self.tegs.firstIndex(of: teg){
            for tegIndex in 0..<self.tegs.count{
                self.tegs[tegIndex].isSelected = tegIndex == index ? true : false
            }
            for dishIndex in 0..<self.dishes.count{
                self.dishes[dishIndex].isNeedBeShowen = self.dishes[dishIndex].tegs.contains(where: {$0 == teg.name}) ? true : false
            }
        }
    }
    
    func getDishes(){
        DispatchQueue.main.async {
            let dishGetter = DishGetter()
            dishGetter.getDishes(completion: {[weak self] dishes in
                var newTegsArray = [Teg(name: "Все меню", isSelected: true)]
                for i in dishes{
                    i.tegs.forEach { iteg in
                        if !newTegsArray.contains(where: {newTagsArrayTeg in
                            newTagsArrayTeg.name == iteg}){
                            newTegsArray.append(Teg(name: iteg))
                        }
                    }
                }
                self?.tegs = newTegsArray
                self?.dishes = dishes
            })
        }

    }
    
    init(coordinator: MainCategoryCoordinator, category: String, cache: ImageCache) {
        self.coordinator = coordinator
        self.category = category
        self.cache = cache
    }
}
