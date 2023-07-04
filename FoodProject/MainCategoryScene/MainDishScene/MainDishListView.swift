//
//  MainDishView.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 30.06.2023.
//

import SwiftUI

struct MainDishListView: View {
    
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    @ObservedObject var mainDishViewModel: MainDishListViewModel
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var fullDataScreen: DishFullDisplayInfo
    
    var body: some View {
            tegsContent
            gridContent
        .onAppear{
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            mainDishViewModel.getDishes()
            mainDishViewModel.getTegs()
        }
        
        
    }
    
    private var tegsContent: some View{
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem()]) {
                ForEach(mainDishViewModel.tegs){teg in
                    Button {
                    } label: {
                        Text(teg.name)
                            .background {
                                if teg.isSelected{
                                    Color.blue
                                }
                                else{
                                    Color.gray
                                }
                            }
                            .frame(
                                width: 100,
                                height: 30
                            )
                    }
                    
                }
            }
        }
        .aspectRatio(contentMode: .fit)
    }
    
    
    private var gridContent: some View {
        ScrollView(showsIndicators: false){
            LazyVGrid(columns: columns, spacing: 10){
                ForEach(mainDishViewModel.dishes.sorted(by: {$0.id < $1.id})) { dish in
                    VStack{
                        Color(UIColor(red: 248.0/255.0, green: 247.0/255.0, blue: 245.0/255.0, alpha: 1.0))
                            .overlay {
                                GeometryReader { geometry in
                                    AppAsyncImage(url: dish.imageURL,
                                                  cache: mainDishViewModel.cache) {
                                        ProgressView()
                                            .progressViewStyle(CircularProgressViewStyle(tint: Color.black))
                                            .frame(width: geometry.size.width, height: geometry.size.width, alignment: .center)
                                    }
                                                  .aspectRatio(contentMode: .fit)
                                                  .padding(.leading, 5)
                                                  .padding(.top, 5)
                                                  .frame(width: geometry.size.width, height: geometry.size.width, alignment: .center)
                                }
                            }.aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                        Text(dish.name)
                            .frame(alignment: .bottom)
                            .lineLimit(2, reservesSpace: true)
                    }
                    .padding(.top)
                    .onTapGesture {
                        fullDataScreen.dish = dish
                    }
                    
                }
            }
        }
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
    
    init(with mainDishViewModel: MainDishListViewModel) {
        self.mainDishViewModel = mainDishViewModel
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
