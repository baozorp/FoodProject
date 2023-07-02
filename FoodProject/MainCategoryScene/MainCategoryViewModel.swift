//
//  MainCategoryViewModel.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 29.06.2023.
//

import Foundation

class MainCategoryViewModel: ObservableObject{
    
    @Published var categories: [CategoryModel] = []
    
    private unowned let coordinator: MainCategoryCoordinator
    
    func getDestinashion(category: String) -> MainDishView{
        coordinator.nextDestination(category: category) as! MainDishView
    }
    
    init(coordinator: MainCategoryCoordinator) {
        self.coordinator = coordinator
        DispatchQueue.global(qos: .userInteractive).async{
            let categoryGetter = CategoryGetter()
            categoryGetter.getCategories(completion: {[weak self] categories in
                DispatchQueue.main.async {
                    self?.categories = categories
                }
            })
        }
    }
}
