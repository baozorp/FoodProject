//
//  CartCoordinator.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 29.06.2023.
//

import Foundation
import SwiftUI

class CartCoordinator: Coordinator{
    func start() -> any View {
        Text("2")
    }
    
    var childs: [Coordinator]
    var parent: Coordinator!
    var scene: Scenes
    
    init(parent: Coordinator!) {
        self.childs = []
        self.parent = parent
        self.scene = .cart
    }
}
