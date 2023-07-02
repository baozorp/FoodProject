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
    
    
    private var mainViewModel: MainCategoryViewModel!
    private var mainView: MainCategoryView!

    func start() -> any View {
        
        return mainView
    }
    
    func nextDestination(category: String) -> any View{
        self.childs = [MainDishCoordinator(parent: self, category: category)]
        return self.childs[0].start()
    }
    
    
    init(parent: Coordinator!) {
        self.parent = parent
        self.mainViewModel = MainCategoryViewModel(coordinator: self)
        self.mainView = MainCategoryView(coordinator: self, mainCategoryViewModel: self.mainViewModel)
    }
}
