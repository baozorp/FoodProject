//
//  NavigationBarItems.swift
//  FoodProject
//
//  Created by Михаил Шекунов on 04.07.2023.
//

import SwiftUI

struct InfoBarItem: View {
    
    private var date: String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.setLocalizedDateFormatFromTemplate("d MMMM, yyyy")
        let today = Date()
        let formattedDate = dateFormatter.string(from: today)
        return formattedDate
    }
    
    var body: some View {
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
}


struct ProfileBarItem: View {
    var body: some View {
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
}
