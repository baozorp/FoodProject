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
    @Published var dishViewModel: MainDishListViewModel!
    @Published var dishDescriptionViewModel: DishDescriptionViewModel!
    
    
    private var mainView: MainCategoryView!

    func start() -> any View {
        self.mainViewModel = MainCategoryViewModel(coordinator: self, cache: cache)
        self.mainView = MainCategoryView(coordinator: self)
        return mainView
    }
    
    func getDishesList(category: String) -> MainDishListView{
        self.dishViewModel = MainDishListViewModel(coordinator: self, category: category, cache: self.cache)
        return MainDishListView(with: self.dishViewModel)
    }
    
    func getFullScreenDescription(dish: DishModel) -> DishDescriptionView{
        parent.getFullScreenDescription(dish: dish)
    }
    
    
    init(parent: AppCoordinator, cache: ImageCache) {
        self.parent = parent
        self.cache = cache
    }
}
