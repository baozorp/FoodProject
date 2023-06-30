//
//  MainDishCoordinator.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 30.06.2023.
//

import Foundation
import SwiftUI

class MainDishCoordinator: Coordinator{
    
    var scene: Scenes = .main
    var childs: [Coordinator] = []
    var parent: Coordinator!
    var category: String
    
    private var mainDishViewModel: MainDishViewModel!
    private var mainDishView: MainDishView!

    func start() -> any View {
        return mainDishView
    }
    
    init(parent: Coordinator!, category: String) {
        self.parent = parent
        self.category = category
        self.mainDishViewModel = MainDishViewModel(coordinator: self)
        self.mainDishView = MainDishView(coordinator: self, mainDishViewModel: self.mainDishViewModel)
    }
}