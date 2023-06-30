//
//  MainCoordinator.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 29.06.2023.
//

import Foundation

class MainCoordinator: ObservableObject{
    
    @Published private var mainViewModel: MainViewModel!
    @Published private var mainView: MainView!
    
    private unowned let parent: Coordinator!
    
    func getView() -> MainView{
        return mainView
    }
    
    init(parent: Coordinator!) {

        self.parent = parent
        self.mainViewModel = MainViewModel(coordinator: self)
        self.mainView = MainView(coordinator: self, mainViewModel: self.mainViewModel)
    }
}
