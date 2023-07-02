//
//  SearchCoordinator.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 01.07.2023.
//

import Foundation
import SwiftUI

class SearchCoordinator: Coordinator{
    
    var childs: [Coordinator]
    var parent: Coordinator!
    var scene: Scenes
    var cache: ImageCache
    
    func start() -> any View {
        Text("Search scene")
    }
    
    init(parent: Coordinator!, cache: ImageCache) {
        self.childs = []
        self.parent = parent
        self.scene = .search
        self.cache = cache
    }
}
