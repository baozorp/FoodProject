//
//  MainCategoryView.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 29.06.2023.
//

import SwiftUI

struct MainCategoryView: View {
    
    @ObservedObject var mainViewModel: MainCategoryViewModel
    
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
            VStack{
                ForEach(mainViewModel.categories.sorted(by: {$0.id < $1.id})) { category in
                    NavigationLink(destination: mainViewModel.getDishesList(category: category.name)){
                        ZStack(alignment: .topLeading) {
                            AppAsyncImage(url: category.imageURL,
                                          cache: mainViewModel.cache) {
                                Text("")
                            }
                            .aspectRatio(contentMode: .fit)
                                    .overlay(
                                        GeometryReader(content: { geometry in
                                            Text(category.name)
                                                .foregroundColor(.black)
                                                .font(.title)
                                                .fontWeight(.semibold)
                                                .multilineTextAlignment(.leading)
                                                .lineLimit(3)
                                                .frame(width: geometry.size.width * 0.6, height: geometry.size.height, alignment: .topLeading)
                                                .padding()
                                        })
                                    )
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.vertical)
        }
        .padding(.horizontal)
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
    
    init(coordinator: MainCategoryCoordinator) {
        self.mainViewModel = coordinator.mainViewModel
    }
}
