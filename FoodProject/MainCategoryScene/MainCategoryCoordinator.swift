//
//  MainCategoryCoordinator.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 29.06.2023.
//

import Foundation
import SwiftUI

class MainCategoryCoordinator: Coordinator{
    
    var scene: Scenes = .main
    var childs: [Coordinator] = []
    var parent: Coordinator!
    var cache: ImageCache
    
    
    private var mainViewModel: MainCategoryViewModel!
    private var mainView: MainCategoryView!

    func start() -> any View {
        
        return mainView
    }
    
    func nextDestination(category: String) -> any View{
        self.childs = [MainDishCoordinator(parent: self, category: category, cache: cache)]
        return self.childs[0].start()
    }
    
    
    init(parent: Coordinator!, cache: ImageCache) {
        self.parent = parent
        self.cache = cache
        self.mainViewModel = MainCategoryViewModel(coordinator: self)
        self.mainView = MainCategoryView(coordinator: self, mainCategoryViewModel: self.mainViewModel)
    }
}
