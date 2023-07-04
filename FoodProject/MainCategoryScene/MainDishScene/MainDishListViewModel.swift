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
    
    struct Teg:Identifiable{
        let id = UUID()
        let name: String
        let isSelected: Bool = false
    }
    
    func getDishes(){
        DispatchQueue.main.async {
            let dishGetter = DishGetter()
            dishGetter.getDishes(completion: {[weak self] dishes in
                var newTegsArray = [Teg(name: "Все меню")]
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
    
    func getTegs(){
        var newTegsArray = [Teg(name: "Все меню")]
        for i in dishes{
            i.tegs.forEach { iteg in
                if !newTegsArray.contains(where: {newTagsArrayTeg in
                    newTagsArrayTeg.name == iteg}){
                    newTegsArray.append(Teg(name: iteg))
                }
            }
            
        }
        self.tegs = newTegsArray
    }
    
    func cleanDishes(){
        self.dishes = []
    }
    
//    func getTags
    
    init(coordinator: MainCategoryCoordinator, category: String, cache: ImageCache) {
        self.coordinator = coordinator
        self.category = category
        self.cache = cache
    }
}
