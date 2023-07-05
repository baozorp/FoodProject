//
//  AppCoordinatorView.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 29.06.2023.
//

import SwiftUI

struct AppCoordinatorView: View {
    
    @ObservedObject var coordinator: AppCoordinator
    @StateObject var dishFullDisplayInfo: DishFullDisplayInfo = DishFullDisplayInfo()
    @StateObject var cartArray: CartArray = CartArray()
    @State private var isNeedToShowFullDisplayInfo = false
    
    var body: some View {
        ZStack{
            TabView(selection: $coordinator.scene){
                ForEach(coordinator.coordinatorViewModel.appElements){element in
                    NavigationView {
                        switch element.scene{
                        case .main:
                            element.view as! MainCategoryView
                        case .cart:
                            element.view as! CartView
                            
                        default:
                            Text(element.name)
                        }
                    }
                    .padding(.bottom, 0.1)
                    .onAppear{
                        let tabBarAppearance = UITabBarAppearance()
                        tabBarAppearance.configureWithDefaultBackground()
                        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
                        let navigationBarAppearance = UINavigationBarAppearance()
                        navigationBarAppearance.configureWithOpaqueBackground()
                        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance}
                    .tabItem {
                        element.image
                        Text(element.name)
                    }
                    .tag(element.scene)
                }
            }
            //.allowsHitTesting(!coordinator.coordinatorViewModel.isNeedToShowFullDisplayInfo)
            .tint(.blue)
            if dishFullDisplayInfo.isNeedToShowFullDisplayInfo{
                coordinator.getFullScreenDescription(dish: dishFullDisplayInfo.dish)
            }
            else{
                Text("")
            }
        }
        .environmentObject(dishFullDisplayInfo)
        .environmentObject(cartArray)
    }
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
}

struct AppCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        AppCoordinator().start() as! AppCoordinatorView
    }
}
