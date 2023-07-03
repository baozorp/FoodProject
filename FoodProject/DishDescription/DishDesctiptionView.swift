//
//  DishDesctiptionView.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 03.07.2023.
//

import Foundation
import SwiftUI

struct DishDescriptionView: View{
    
    @ObservedObject var dishDescriptionViewModel: DishDescriptionViewModel
    
    
    var body: some View{
        ZStack{
            Color(uiColor: UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.4))
                .ignoresSafeArea()
            GeometryReader{geometry in
                
            }
        }
    }
    
    init(with dishDescriptionViewModel: DishDescriptionViewModel) {
        self.dishDescriptionViewModel = dishDescriptionViewModel
    }
}
