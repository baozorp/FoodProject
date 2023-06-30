//
//  CoordinatorView.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 29.06.2023.
//

import SwiftUI

struct CoordinatorView: View {
    
    @ObservedObject var coordinator: Coordinator
    let mainView: MainView
    
    var body: some View {
        TabView {
            NavigationView {
                mainView

            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Главная")
            }
            
            
            Text("")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Поиск")
                }
            Text("da")
                .tabItem {
                    Image(systemName: "basket")
                    Text("Корзина")
                }
            Text("")
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Аккаунт")
                }
        }
    }
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        self.mainView = coordinator.mainCoordinator.getView()
    }
}

struct CoordinatorView_Previews: PreviewProvider {
    
    static var previews: some View {
        @StateObject var coordinator = Coordinator()
        CoordinatorView(coordinator: coordinator)
    }
}
