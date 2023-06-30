//
//  MainView.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 29.06.2023.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var coordinator: MainCoordinator
    @ObservedObject var mainViewModel: MainViewModel
    
    private var date: String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.setLocalizedDateFormatFromTemplate("d MMMM, yyyy")
        let today = Date()
        let formattedDate = dateFormatter.string(from: today)
        return formattedDate
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(mainViewModel.categories) { category in
                NavigationLink(destination: CVP()){
                    CategoryView(category: category)
                }
            }

        }
        .navigationBarItems(leading: leadingBarContent, trailing: trailingBarContent)
        .padding(.horizontal)
    }
    
    // For categories
    private func CategoryView(category: CategoryModel) -> some View {
        ZStack(alignment: .topLeading) {
            Image(uiImage: category.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            GeometryReader { geometry in
                Text(category.name)
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
    
    // For leading Navigation Bar items
    private var leadingBarContent: some View {
        HStack {
            Image(systemName: "mappin.and.ellipse")
            VStack(alignment: .leading){
                Text("Москва")
                    .fontWeight(.semibold)
                    .frame(alignment: .leading)
                    .font(.title3)
                Text(date)
                    .foregroundColor(Color(
                        red: Double(0) / 255,
                        green: Double(0) / 255,
                        blue: Double(0) / 255,
                        opacity: Double(255/2) / 255)
                    )
                    .frame(alignment: .leading)
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding(.bottom, 3)
    }
    
    // For trailing Navigation Bar items
    private var trailingBarContent: some View {
        HStack{
            Spacer()
            Image("account icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .padding(.bottom, 3)
        }

    }
    
}



struct CVP: View{
    var body: some View{
        Text("New screen")
    }
}
