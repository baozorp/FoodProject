//
//  FoodModel.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 29.06.2023.
//

import Foundation
import SwiftUI

class DogModel: Identifiable, ObservableObject {
    let id: Int
    let name: String
    let description: String
    let age: Int
    @Published var image = UIImage()
    
    init(id: Int, name: String, description: String, age: Int, image: UIImage = UIImage()) {
        self.id = id
        self.name = name
        self.description = description
        self.age = age
        self.image = image
    }
}
