//
//  AppCoordinator.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 29.06.2023.
//

import Foundation
import SwiftUI


enum Scenes{
    case main
    case search
    case cart
    case account
}

protocol Coordinator{
    
    var childs: [Coordinator]{get set}
//    var parent: Coordinator! {get set}
    var scene: Scenes{get}
    var cache: ImageCache{get}
    
    func start() -> any View
}


class AppCoordinator: Coordinator, ObservableObject{
    
    
    var scene: Scenes
    var childs: [Coordinator] = []
    var parent: Coordinator!
    let cache: ImageCache
    
    
    var coordinatorViewModel: AppCoordinatorViewModel!
    private var coordinatorView: AppCoordinatorView!
    
    func start() -> any View {
        //TODO: Add searchCoordinator, accountCoordinator
        self.childs.append(MainCategoryCoordinator(parent: self, cache: cache))
        self.childs.append(SearchCoordinator(parent: self, cache: cache))
        self.childs.append(CartCoordinator(parent: self, cache: cache))
        self.childs.append(AccountCoordinator(parent: self, cache: cache))
        self.coordinatorViewModel = AppCoordinatorViewModel(coordinator: self)
        self.coordinatorView = AppCoordinatorView(coordinator: self)
        return coordinatorView
    }
    
    func getFullScreenDescription(dish: DishModel) -> DishDescriptionView{
        let dishDescriptionViewModel = DishDescriptionViewModel(dish: dish, coordinator: self, cache: self.cache)
        return DishDescriptionView(with: dishDescriptionViewModel)
    }
    
    init() {
        self.scene = .main
        self.cache = TemporaryImageCache()
        self.parent = self
    }
}
