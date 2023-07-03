//
//  FoodProjectApp.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 29.06.2023.
//

import SwiftUI

@main
struct FoodProjectApp: App {
    
    @StateObject var coordinator = AppCoordinator()

    
    var body: some Scene {
        WindowGroup {
            self.coordinator.start() as! AppCoordinatorView
        }
    }
}
