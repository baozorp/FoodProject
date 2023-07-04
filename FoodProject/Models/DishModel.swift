//
//  DishModel.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 29.06.2023.
//

import Foundation
import SwiftUI

struct DishModel: Identifiable, Equatable{
    let id: Int
    let name: String
    let price: Int
    let weight: Int
    let description: String
    let imageURL: String
    let tegs: [String]
    var countInCart: Int = 0
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
    let tegs: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, name, price, weight, description, tegs
        case imageURL = "image_url"
    }
}

class DishGetter{
    func getDishes(completion: @escaping ([DishModel]) -> Void){
        
        guard let url = URL(string: "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b") else {
            // TODO: error handling
            return
        }
        let session = URLSession.shared
        

        let task = session.dataTask(with: url) { data, response, error in
            
            var dishes: [DishModel] = []
            
            if let error = error {
                // TODO: error handling
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
                for i in categoriesJson.dishes {
                    let dish = DishModel(id: i.id, name: i.name, price: i.price, weight: i.weight, description: i.description, imageURL: i.imageURL, tegs: i.tegs)
                    print(i.tegs)
                    dishes.append(dish)
                }
                DispatchQueue.main.async{
                    completion(dishes)
                }
            }
        }
        task.resume()
    }
}
