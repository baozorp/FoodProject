//
//  AppCoordinatorViewModel.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 30.06.2023.
//

import Foundation

class AppCoordinatorViewModel: ObservableObject{
    
    private unowned let coordinator: AppCoordinator!
    @Published var appElements: [AppModel]
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        self.appElements = []
        coordinator.childs.forEach { coordinator in
            self.appElements.append(AppModel(view: coordinator.start(), scene: coordinator.scene))
        }
    }
}
