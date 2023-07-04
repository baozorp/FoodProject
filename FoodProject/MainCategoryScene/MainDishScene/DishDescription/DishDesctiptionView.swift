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
    @EnvironmentObject var fullDataScreen: DishFullDisplayInfo
    @EnvironmentObject var cartArray: CartArray
    
    var body: some View{
        ZStack{
            Color(uiColor: UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.4))
                .ignoresSafeArea()
                .onTapGesture {
                    fullDataScreen.hide()
                }
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(20)
                .overlay {
                    descriptionBlock
                    
                }
                .frame(width: UIScreen.main.bounds.width * 0.9,
                       height: UIScreen.main.bounds.height * 4/7,
                       alignment: .center)
        }
    }
    
    private var descriptionBlock: some View{
        VStack{
            ZStack{
                ScrollView(showsIndicators: false){
                    VStack(alignment: .leading){
                        image
                            .aspectRatio(contentMode: .fit)
                        Text(dishDescriptionViewModel.dish.name)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.vertical, 4)
                            .padding(.leading)
                        HStack{
                            Text("\(dishDescriptionViewModel.dish.price) ₽")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .padding(.leading)
                            Text("\(dishDescriptionViewModel.dish.weight)г")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(Color(uiColor: UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.6)))
                        }
                        Text(dishDescriptionViewModel.dish.description)
                            .padding(.vertical, 4)
                            .padding(.leading)
                        Spacer()
                    }
                    .padding(.vertical)
                }
                
                
            }
            Button {
                cartArray.addDishToCart(dish: dishDescriptionViewModel.dish)
            } label: {
                GeometryReader{geometry in
                    Rectangle()
                        .frame(width: geometry.size.width)
                        .overlay {
                            Text("Добавить в корзину")
                                .foregroundColor(Color.white)
                        }
                        .cornerRadius(20)
                }
            }
            .frame(height: UIScreen.main.bounds.height/12)
            .padding(.horizontal)
            .padding(.bottom)
            .buttonStyle(.plain)
            .foregroundColor(.blue)
        }
        
    }
    
    private var image: some View{
        
        ZStack{
            Color(uiColor: UIColor(red: 248.0/255.0, green: 247.0/255.0, blue: 245.0/255.0, alpha: 1.0))
                .cornerRadius(5)
                .overlay{
                    GeometryReader{ geometry in
                        AsyncImage(url: URL(string: dishDescriptionViewModel.dish.imageURL)!) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width*0.9, height: geometry.size.width*0.9, alignment: .center)
                                .padding(.leading)
                                .padding(.top)
                        } placeholder: {
                            Text("")
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width*0.9, height: geometry.size.width*0.9, alignment: .center)
                                .padding(.leading)
                                .padding(.top)
                        }
                    }
                    .aspectRatio(contentMode: .fit)
                }
                .padding(.top)
                .padding(.horizontal)
            buttons
        }
        
    }
    
    private var buttons: some View{
        GeometryReader{ geometry in
            HStack{
                Spacer()
                Button {
                } label: {
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .aspectRatio(contentMode: .fit)
                        .overlay {
                            Image(systemName: "heart")
                                .resizable()
                                .padding()
                        }
                        .frame(width: geometry.size.width/6,
                               height: geometry.size.width/6)
                        .aspectRatio(contentMode: .fit)
                }
                .padding(.top, 20)
                .foregroundColor(.black)
                .buttonStyle(.plain)
                Button {
                    fullDataScreen.hide()
                } label: {
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .aspectRatio(contentMode: .fit)
                        .overlay {
                            Image(systemName: "xmark")
                                .resizable()
                                .padding()
                        }
                        .frame(width: geometry.size.width/6,
                               height: geometry.size.width/6)
                        .aspectRatio(contentMode: .fit)
                    
                }
                .padding(.trailing, 20)
                .padding(.top, 20)
                .foregroundColor(.black)
                .buttonStyle(.plain)
                
            }
            .frame(width: geometry.size.width,
                   height: geometry.size.height,
                   alignment: .topTrailing)


        }
    }
    
    init(with dishDescriptionViewModel: DishDescriptionViewModel) {
        self.dishDescriptionViewModel = dishDescriptionViewModel
    }
}
