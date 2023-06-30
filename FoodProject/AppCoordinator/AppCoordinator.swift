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
    var parent: Coordinator! {get set}
    var scene: Scenes{get}
    
    func start() -> any View
}

class AppCoordinator: Coordinator{
        
    var childs: [Coordinator] = []
    var parent: Coordinator!
    
    private var coordinatorViewModel: AppCoordinatorViewModel!
    private var coordinatorView: AppCoordinatorView!
    
    func start() -> any View {
        self.childs.append(MainCategoryCoordinator(parent: self))
        self.childs.append(CartCoordinator(parent: self))
        self.coordinatorViewModel = AppCoordinatorViewModel(coordinator: self)
        self.coordinatorView = AppCoordinatorView(coordinator: self, appCoordinatorViewModel: self.coordinatorViewModel)
        return coordinatorView
    }
    
    
    var scene: Scenes
    
    static var appScene: Scenes = .main
//    var mainCoordinator: MainCategoryCoordinator!
//    var cartCoordinator: CartCoordinator!
    //TODO: Add searchCoordinator, accountCoordinator

    
    init() {
        self.scene = .main
        self.parent = self
    }
}
