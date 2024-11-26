//
//  FoodItemView.swift
//  FitKid
//
//  Created by 许鹏程 on 2023/6/12.
//

import SwiftUI

struct FoodItemView: View {
    let food: Food
    @State private var isDetailViewPresented = false
    //添加点击手势
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ZStack {
                Image(food.image)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
            }
            .background(
                Color(red: food.red, green: food.green, blue: food.blue))
            Text(food.name)
                .font(.title3)
                .fontWeight(.black)
            Text(food.formattedCaloric)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
        }
        .onTapGesture {
               isDetailViewPresented = true
           }
        //点击手势 被点击后上面这个显示true，显示下面的FoodDetailView
           .fullScreenCover(isPresented: $isDetailViewPresented) {
           FoodDetailView(onDismiss: {}, foodName: food.name, foodRecords: .constant([]))
        }
    }
}

struct FoodItemView_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemView(food: foods[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
