//
//  CartView.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 03.07.2023.
//

import SwiftUI

struct CartView: View {
    
    @ObservedObject var cartViewModel: CartViewModel
    @EnvironmentObject var cartArray: CartArray
    private var date: String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.setLocalizedDateFormatFromTemplate("d MMMM, yyyy")
        let today = Date()
        let formattedDate = dateFormatter.string(from: today)
        return formattedDate
    }
    
    var body: some View {
        VStack{
            ScrollView{
                
                ForEach(cartArray.cartArray) { dish in
                    HStack{
                        Color(UIColor(red: 248.0/255.0, green: 247.0/255.0, blue: 245.0/255.0, alpha: 1.0))
                            .overlay {
                                GeometryReader { geometry in
                                    AppAsyncImage(url: dish.imageURL,
                                                  cache: cartViewModel.cache) {
                                        Text("")
                                    }
                                                  .aspectRatio(contentMode: .fit)
                                                  .padding(.leading, 5)
                                                  .padding(.top, 5)
                                                  .padding(.trailing, 2)
                                                  .frame(width: geometry.size.width, height: geometry.size.width, alignment: .center)
                                }
                            }.aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .frame(width: UIScreen.main.bounds.width/4,
                                   height: UIScreen.main.bounds.width/4)
                            .aspectRatio(contentMode: .fit)
                        VStack(alignment: .leading){
                            Text(dish.name)
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                            HStack{
                                Text("\(dish.price) ₽")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                Text("\(dish.weight)г")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(uiColor: UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.6)))
                            }
                        }
                        Spacer()
                        HStack{
                            Button {
                                withAnimation{
                                    cartArray.removeDishFromCart(dish: dish)
                                }
                                
                            } label: {
                                Text("-")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .padding(.all, 3)
                            }
                            .padding(.all, 2)
                            Text("\(dish.countInCart)")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .padding(.all, 3)
                            Button {
                                withAnimation{
                                    cartArray.addDishToCart(dish: dish)
                                }
                                
                            } label: {
                                Text("+")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                .padding(.all, 3)                        }
                        }
                        .padding(.horizontal, 5)
                        
                        .foregroundColor(Color.black)
                        .background {
                            Rectangle()
                                .cornerRadius(10)
                                .foregroundColor(Color(uiColor: UIColor(red: 239.0/255.0, green: 238.0/255.0, blue: 236.0/255.0, alpha: 1.0)))
                        }
                    }
                }
                .padding(.all)
            }

        Button {
        } label: {
            GeometryReader{geometry in
                Rectangle()
                    .frame(width: geometry.size.width)
                    .overlay {
                        Text("Оплатить \(cartArray.getCartCost()) ₽")
                            .foregroundColor(Color.white)
                    }
                    .cornerRadius(20)
            }
        }
        .frame(height: UIScreen.main.bounds.height/15)
        .padding(.horizontal)
        .buttonStyle(.plain)
        .foregroundColor(.blue)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                InfoBarItem()
            }
            ToolbarItem(placement: .navigationBarTrailing){
                ProfileBarItem()
            }
        }
    }
    
    init(coordinator: CartCoordinator) {
        self.cartViewModel = coordinator.cartViewModel
    }
}


