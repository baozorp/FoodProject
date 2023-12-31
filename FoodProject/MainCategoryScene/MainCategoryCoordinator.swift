//
//  MainCategoryCoordinator.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 29.06.2023.
//

import Foundation
import SwiftUI


class MainCategoryCoordinator: Coordinator, ObservableObject{
    
    var scene: Scenes = .main
    var childs: [Coordinator] = []
    unowned var parent: AppCoordinator!
    var cache: ImageCache
    
    
    @Published var mainViewModel: MainCategoryViewModel!
    @Published var dishListViewModel: MainDishListViewModel!
    @Published var dishDescriptionViewModel: DishDescriptionViewModel!
    


    func start() -> any View {
        self.mainViewModel = MainCategoryViewModel(coordinator: self, cache: self.cache)
        return MainCategoryView(coordinator: self)
    }
    
    func getDishesList(category: String) -> MainDishListView{
        self.dishListViewModel = MainDishListViewModel(coordinator: self, category: category, cache: self.cache)
        return MainDishListView(with: self.dishListViewModel)
    }
    
    init(parent: AppCoordinator, cache: ImageCache) {
        self.parent = parent
        self.cache = cache
    }
}
