//
//  AppCoordinatorView.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 29.06.2023.
//

import SwiftUI

struct AppCoordinatorView: View {
    
    unowned let coordinator: AppCoordinator
    @ObservedObject var appCoordinatorViewModel: AppCoordinatorViewModel
    @State private var selectedTab: Scenes = .main
    
    var body: some View {
        
        TabView(selection: $selectedTab){
            ForEach(appCoordinatorViewModel.appElements){element in
                NavigationView {
                    switch element.scene{
                    case .main:
                        element.view as! MainCategoryView
                    default:
                        Text(element.name)
                    }
                }
                .onAppear{let navigationBarAppearance = UINavigationBarAppearance()
                          navigationBarAppearance.configureWithOpaqueBackground()
                          UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance}
                .tabItem {
                    element.image
                    Text(element.name)
                }
                .tag(element.scene)
            }
        }
        .tint(.blue)

    }
    
    init(coordinator: AppCoordinator, appCoordinatorViewModel: AppCoordinatorViewModel) {
        self.coordinator = coordinator
        self.appCoordinatorViewModel = appCoordinatorViewModel
    }
}

struct AppCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        AppCoordinator().start() as! AppCoordinatorView
    }
}
