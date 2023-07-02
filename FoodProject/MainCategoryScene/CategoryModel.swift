//
//  CategoryModel.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 29.06.2023.
//

import Foundation
import SwiftUI

struct CategoryModel: Identifiable{
    let id: Int
    let name: String
    var imageURL: String
}

fileprivate struct ResponseCategoryDecoder: Decodable{
    let сategories: [CategoryDecoder]
}

fileprivate struct CategoryDecoder: Decodable{
    let id: Int
    let name: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
    }
}

class CategoryGetter{
    func getCategories(completion: @escaping ([CategoryModel]) -> Void){
        
        guard let url = URL(string: "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54") else {
            return
        }
        let session = URLSession.shared
        
        
        let task = session.dataTask(with: url) { data, response, error in
            
            var categories: [CategoryModel] = []
            
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
                for i in categoriesJson.сategories {
                    let category = CategoryModel(id: i.id, name: i.name, imageURL: i.imageURL)
                    categories.append(category)
                }
                DispatchQueue.main.async{
                    completion(categories)
                }
            }
            
        }
        task.resume()
    }
}
