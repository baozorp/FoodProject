//
//  FoodProjectApp.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 29.06.2023.
//

import SwiftUI

@main
struct FoodProjectApp: App {
    
    var coordinator: AppCoordinator
    var view: AppCoordinatorView
    
    var body: some Scene {
        WindowGroup {
            self.view
        }
    }
    
    init() {
        self.coordinator = AppCoordinator()
        self.view = self.coordinator.start() as! AppCoordinatorView
    }
}
