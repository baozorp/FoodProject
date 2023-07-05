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
    @Environment(\.scenePhase) var scenePhase
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var fullDataScreen: DishFullDisplayInfo
    
    var body: some View {
        VStack{
            tegsContent
            gridContent
        }
        .navigationBarTitle(mainDishViewModel.category)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                leadingBarContent
            }
            ToolbarItem(placement: .navigationBarTrailing){
                ProfileBarItem()
            }
        }
        .onAppear{
            mainDishViewModel.getDishes()
        }
        .onChange(of: scenePhase) { newValue in
            if newValue == .active{
                mainDishViewModel.getDishes()
                print(newValue)
            }
        }
    }
    
    private var tegsContent: some View{
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(mainDishViewModel.tegs) { teg in
                    Button(action: {
                        withAnimation {
                            mainDishViewModel.selectedTeg(teg: teg)
                        }
                    }) {
                        ZStack{
                            if teg.isSelected{
                                Color.blue
                                    .cornerRadius(10)
                                Text(teg.name)
                                    .foregroundColor(.white)
                                    .padding(.all, UIScreen.main.bounds.height / 100)
                            }
                            else{
                                Color(uiColor: UIColor(red: 248.0/255.0, green: 247.0/255.0, blue: 245.0/255.0, alpha: 1.0))
                                    .cornerRadius(10)
                                Text(teg.name)
                                    .foregroundColor(.black)
                                    .padding(.all, UIScreen.main.bounds.height / 100)
                            }
                        }
                        .padding(.top, 5)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)
        }
        .frame(height: UIScreen.main.bounds.height / 20)
    }
    
    
    private var gridContent: some View {
        ScrollView(showsIndicators: false){
            LazyVGrid(columns: columns, spacing: 10){
                ForEach(mainDishViewModel.dishes.sorted(by: {$0.id < $1.id})) { dish in
                    if dish.isNeedBeShowen{
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
                            fullDataScreen.setDish(dish: dish)
                        }
                    }
                }
            }
            .padding(.horizontal)
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
