//
//  MainCategoryView.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 29.06.2023.
//

import SwiftUI

struct MainCategoryView: View {
    
    @ObservedObject var mainViewModel: MainCategoryViewModel
    
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
                InfoBarItem()
            }
            ToolbarItem(placement: .navigationBarTrailing){
                ProfileBarItem()
            }
        }
        .onAppear{
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }

    
    init(coordinator: MainCategoryCoordinator) {
        self.mainViewModel = coordinator.mainViewModel
    }
}
