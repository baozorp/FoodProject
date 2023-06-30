//
//  Coordinator.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 29.06.2023.
//

import Foundation

//protocol Coordinator{
//    func start()
//}

enum Scenes{
    case main
    case search
    case cart
    case account
}

class Coordinator: ObservableObject{
    
    var scene: Scenes
    var mainCoordinator: MainCoordinator!
    var cartCoordinator: CartCoordinator!
    //TODO: Add searchCoordinator, accountCoordinator

    
    init() {

        self.scene = .main
        self.mainCoordinator = MainCoordinator(parent: self)
        self.cartCoordinator = CartCoordinator(parent: self)
    }
}
