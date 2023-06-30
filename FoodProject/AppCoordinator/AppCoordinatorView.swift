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
    
    
    var body: some View {
        TabView{
            ForEach(appCoordinatorViewModel.appElements){element in
                NavigationView {
                    switch element.scene{
                    case .main:
                        element.view as! MainCategoryView

                    default:
                        Text("2")
                    }
                }.tabItem {
                    element.image
                    Text(element.name)
                }
            }
        }
    }
    
    init(coordinator: AppCoordinator, appCoordinatorViewModel: AppCoordinatorViewModel) {
        self.coordinator = coordinator
        self.appCoordinatorViewModel = appCoordinatorViewModel
    }
}
//
//struct CoordinatorView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        @StateObject var coordinator = AppCoordinator()
//        AppCoordinatorView(coordinator: coordinator)
//    }
//}
