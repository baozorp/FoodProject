//
//  MainDishView.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 30.06.2023.
//

import SwiftUI

struct MainDishView: View {
    
    unowned let coordinator: MainDishCoordinator
    @ObservedObject var mainDishViewModel: MainDishViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(mainDishViewModel.dishes) { dish in
                DishView(dish: dish)
            }
        }
        .onAppear {
            mainDishViewModel.getDishes()
        }
        .onDisappear {
            mainDishViewModel.cleanDishes()
            print("disappeared")
        }
    }
    
    // For categories
    private func DishView(dish: DishModel) -> some View {
        ZStack(alignment: .topLeading) {
            Image(uiImage: dish.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            GeometryReader { geometry in
                Text(dish.name)
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(width: geometry.size.width * 0.8, alignment: .topLeading)
                    .padding()
            }
        }
    }
}
