//
//  RowCaloriesFakeDataView.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/18.
//

import SwiftUI

struct RowCaloriesFakeDataView: View {
    @State var image : String
    @State var calories : Int
    @State var jumptime : String
    //@State var
    var body: some View {
        HStack
        {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .offset(x: 25)
            Text("消耗")
                .font(.system(size: 15))
                .offset(x: 25)
            Text("\(calories)")
                .font(.system(size: 20))
                .fontWeight(.heavy)
                .foregroundColor(Color(CGColor(red: 60 / 255, green: 208 / 255, blue: 241, alpha: 1.0)))
                .offset(x: 25)
            Text("卡路里")
                .font(.system(size: 15))
                .offset(x: 25)
            Image(systemName: "flame.fill").foregroundColor(.red)
                .offset(x: 25)
            VStack
            {
                HStack{
                    Text("耗时")
                        .font(.system(size: 25))
                        .fontWeight(.heavy)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .offset(x: -10)
                    Text("\(jumptime)")
                        .font(.system(size: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .offset(x: -30)
                    Image(systemName: "clock.fill")
                        .foregroundColor(.blue)
                        .offset(x: -45)
                }
                
            }
            .offset(x: 30)
        }
        .frame(width: UIScreen.main.bounds.width - 40 , height: 75)
        .background(.white)
        .cornerRadius(15)
    }
}
