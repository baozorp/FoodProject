//
//  MainCategoryViewModel.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 29.06.2023.
//

import Foundation
import SwiftUI

class MainCategoryViewModel: ObservableObject{
    
    @Published var categories: [CategoryModel] = []
    
    private unowned let coordinator: MainCategoryCoordinator
    var cache: ImageCache
    
    
    func getDishesList(category: String) -> MainDishListView{
        coordinator.getDishesList(category: category)
    }
    
    init(coordinator: MainCategoryCoordinator, cache: ImageCache) {
        self.coordinator = coordinator
        self.cache = cache
        DispatchQueue.global(qos: .userInteractive).async{
            let categoryGetter = CategoryGetter()
            categoryGetter.getCategories(completion: {[weak self] categories in
                DispatchQueue.main.async {
                    self?.categories = categories
                }
            })
        }
    }
}
