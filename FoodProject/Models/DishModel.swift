//
//  DishModel.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 29.06.2023.
//

import Foundation
import SwiftUI

struct DishModel: Identifiable{
    let id: Int
    let name: String
    var weight: Int
    var description: String
    let imageURL: String
}

fileprivate struct ResponseCategoryDecoder: Decodable{
    let dishes: [DishDecoder]
}

fileprivate struct DishDecoder: Decodable{
    let id: Int
    let name: String
    let price: Int
    let weight: Int
    let description: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, price, weight, description
        case imageURL = "image_url"
    }
}

class DishGetter{
    static func getCategories(completion: @escaping ([DishModel]) -> Void){
        
        guard let url = URL(string: "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b") else {
            // Обработка ошибки в случае неверного URL
            return
        }
        let session = URLSession.shared
        
        
        let task = session.dataTask(with: url) { data, response, error in
            
            var dishes: [DishModel] = []
            
            if let error = error {
                print(error)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                let response = response as? HTTPURLResponse
                print("Response asd statuscode is \(response?.statusCode ?? -1)")
                return
            }
            
            if let data = data {
                let categoriesJson = try! JSONDecoder().decode(ResponseCategoryDecoder.self, from: data)
                
                let dispatchGroup = DispatchGroup()
                
                for i in categoriesJson.dishes {
                    dispatchGroup.enter()
                    let dish = DishModel(id: i.id, name: i.name, weight: i.weight, description: i.description, imageURL: i.imageURL)
                    dishes.append(dish)
                    dispatchGroup.leave()
                }
                dispatchGroup.notify(queue: .main) {
                    completion(dishes)
                }
            }
            
        }
        task.resume()
    }
    
    
    
    private init(){
    }
}
