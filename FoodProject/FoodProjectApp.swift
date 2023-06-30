//
//  FoodProjectApp.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 29.06.2023.
//

import SwiftUI

@main
struct FoodProjectApp: App {
    
    @StateObject var coordinator = Coordinator()
    
    var body: some Scene {
        WindowGroup {
            CoordinatorView(coordinator: coordinator)
        }
    }
}
