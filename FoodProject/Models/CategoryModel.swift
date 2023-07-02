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
    var image: UIImage
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
    static func getCategories(completion: @escaping ([CategoryModel]) -> Void){
        
        guard let url = URL(string: "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54") else {
            // Обработка ошибки в случае неверного URL
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
                
                let dispatchGroup = DispatchGroup()
                
                for i in categoriesJson.сategories {
                    dispatchGroup.enter()
                    getImage(i.imageURL) { image in
                        let category = CategoryModel(id: i.id, name: i.name, image: image)
                        categories.append(category)
                        dispatchGroup.leave()
                    }
                }
                dispatchGroup.notify(queue: .main) {
                    completion(categories)
                }
            }
            
        }
        task.resume()
    }
    
    private static func getImage(_ image_url: String, completion: @escaping (UIImage) -> Void) {
        guard let url = URL(string: image_url) else {
            // Обработка ошибки в случае неверного URL
            completion(UIImage())
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                completion(UIImage())
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                let response = response as? HTTPURLResponse
                print("Response image statuscode is \(response?.statusCode ?? -1)")
                completion(UIImage())
                return
            }
            
            if let data = data {
                let image = UIImage(data: data) ?? UIImage()
                completion(image)
            }
        }
        
        task.resume()
    }
    private init(){
    }
}
