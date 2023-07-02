//
//  MainDishView.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 30.06.2023.
//

import SwiftUI

struct MainDishView: View {

    unowned let coordinator: MainDishCoordinator
    @ObservedObject var mainDishViewModel: MainDishViewModel
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView(showsIndicators: false){
            LazyVGrid(columns: columns, spacing: 10){
                ForEach(mainDishViewModel.dishes.sorted(by: {$0.id<$1.id})) { dish in
                    VStack{
                        Color(UIColor(red: 248.0/255.0, green: 247.0/255.0, blue: 245.0/255.0, alpha: 1.0))
                            .overlay {
                                GeometryReader { geometry in
                                    AsyncImage(url: URL(string: dish.imageURL)) { image in
                                        image                                        .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding(.leading, 5)
                                            .padding(.top, 5)
                                            .frame(width: geometry.size.width, height: geometry.size.width, alignment: .center)
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: geometry.size.width, height: geometry.size.width, alignment: .center)
                                    }


                                }
                            }.aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                        Text(dish.name)

                            .frame(alignment: .bottom)
                            .lineLimit(2, reservesSpace: true)
                    }
                    .padding(.top)
                }
            }
            
            
  
        }
        .onAppear {
            mainDishViewModel.getDishes()
        }
        //
        //        .onDisappear {
        //            mainDishViewModel.cleanDishes()
        //        }
        .padding(.horizontal)
        .navigationBarTitle(mainDishViewModel.category)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                leadingBarContent
            }
            ToolbarItem(placement: .navigationBarTrailing){
                trailingBarContent
            }
        }
    }
    
    @ViewBuilder
    private var leadingBarContent: some View {
        HStack{
            Spacer()
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "chevron.backward")
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
        }
    }
    
    @ViewBuilder
    private var trailingBarContent: some View {
        HStack{
            Spacer()
            Image("account icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
        }
        .padding(.vertical, 3)
    }
    
    init(coordinator: MainDishCoordinator, mainDishViewModel: MainDishViewModel) {
        self.coordinator = coordinator
        self.mainDishViewModel = mainDishViewModel
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
    
}

struct DismissingView1: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Dismiss Me") {
            dismiss()
        }
    }
}

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
