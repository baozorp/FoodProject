//
//  AccountCoordinator.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 01.07.2023.
//

import Foundation
import SwiftUI

class AccountCoordinator: Coordinator{
    func start() -> any View {
        Text("Account scene")
    }
    
    var childs: [Coordinator]
    var parent: Coordinator!
    var scene: Scenes
    
    init(parent: Coordinator!) {
        self.childs = []
        self.parent = parent
        self.scene = .account
    }
}
