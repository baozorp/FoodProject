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
        
    var scene: Scenes
    var childs: [Coordinator] = []
    var parent: Coordinator!
    
    var coordinatorViewModel: AppCoordinatorViewModel!
    private var coordinatorView: AppCoordinatorView!
    
    func start() -> any View {
        //TODO: Add searchCoordinator, accountCoordinator
        self.childs.append(MainCategoryCoordinator(parent: self))
        self.childs.append(SearchCoordinator(parent: self))
        self.childs.append(CartCoordinator(parent: self))
        self.childs.append(AccountCoordinator(parent: self))
        self.coordinatorViewModel = AppCoordinatorViewModel(coordinator: self)
        self.coordinatorView = AppCoordinatorView(coordinator: self, appCoordinatorViewModel: self.coordinatorViewModel)
        return coordinatorView
    }
    
    
    init() {
        self.scene = .main
        self.parent = self
    }
}
