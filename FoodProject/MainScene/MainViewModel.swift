//
//  MainViewModel.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 29.06.2023.
//

import Foundation

class MainViewModel: ObservableObject{
    
    @Published var categories: [CategoryModel] = []
    
    private unowned let coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        DispatchQueue.global(qos: .userInteractive).async{
            CategoryGetter.getCategories(completion: {[weak self] categories in
                DispatchQueue.main.async {
                    self?.categories = categories
                }
            })
        }
    }
}
