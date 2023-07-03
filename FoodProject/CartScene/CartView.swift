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
        ScrollView{
            ForEach(cartArray.cartArray) { dish in
                
                HStack{
                    AppAsyncImage(url: dish.imageURL,
                                  cache: cartViewModel.cache)
                    {
                        Text("")
                    }
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
                        } label: {
                            Text("-")
                                .font(.system(size: 20))
                        }
                        
                        Text("1")
                            .font(.system(size: 20))
                        Button {
                        } label: {
                            Text("+")
                                .font(.system(size: 20))
                        }
                    }
                    .padding(.all)
                    .foregroundColor(Color.black)
                    .background {
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundColor(Color(uiColor: UIColor(red: 239.0/255.0, green: 238.0/255.0, blue: 236.0/255.0, alpha: 1.0)))
                    }
                }.aspectRatio(contentMode: .fit)
            }
            .padding(.all)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                leadingBarContent
            }
            ToolbarItem(placement: .navigationBarTrailing){
                trailingBarContent
            }
        }
    }
    
    
    
    
    // For leading Navigation Bar items
    @ViewBuilder
    private var leadingBarContent: some View {
        HStack {
            Image(systemName: "mappin.and.ellipse")
            VStack(alignment: .leading){
                Text("Москва")
                    .fontWeight(.semibold)
                    .frame(alignment: .leading)
                    .font(.subheadline)
                Text(date)
                    .foregroundColor(Color(
                        red: Double(0) / 255,
                        green: Double(0) / 255,
                        blue: Double(0) / 255,
                        opacity: Double(255/2) / 255)
                    )
                    .frame(alignment: .leading)
                    .font(.caption)
            }
            Spacer()
        }
        .padding(.vertical, 3)
    }
    
    // For trailing Navigation Bar items
    @ViewBuilder
    private var trailingBarContent: some View {
        HStack{
            Spacer()
            Button {
            } label: {
                Image("account icon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)
        }
        .padding(.vertical, 3)
    }
    
    init(coordinator: CartCoordinator) {
        self.cartViewModel = coordinator.cartViewModel
    }
}


